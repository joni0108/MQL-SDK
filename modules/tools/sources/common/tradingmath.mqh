#include "../../../internal/errorsHandler.mqh"

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CTradingMath
  {
public:
   double            Winrate(int totalWins, int totalTrades);
   double            Winrate(double &tradeResults[]);
   double            ProfitFactor(double &tradeResults[]);
   double            ProfitFactor(double grossProfit, double grossLoss);
   double            ExpectedValue(double &tradeResults[]);
   double            Expectation(double &tradeResults[]);
   double            AverageWin(double &tradeResults[]);
   double            AverageLoss(double &tradeResults[]);
   double            BiggestWin(double &tradeResults[]);
   double            BiggestLoss(double &tradeResults[]);
   double            StandardDeviation(double &tradeResults[]);
   double            Variance(double &tradeResults[]);
   double            Average(double &dataSample[]);
   double            Average(int &dataSample[]);
  } TradingMath;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CTradingMath::Winrate(int totalWins,int totalTrades)
  {
   if(totalWins > totalTrades || totalTrades <= 0)
   {
      ErrorHandler.SetError(SDK_ERROR_EMPTY_ARRAY);
      return -1;
   }

   return totalWins/totalTrades*100;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CTradingMath::Winrate(double &tradeResults[])
  {
   if(ArraySize(tradeResults) < 1)
   {
      ErrorHandler.SetError(SDK_ERROR_EMPTY_ARRAY);
      return -1;
   }

   int winsTotal = 0;
   int sampleSize = ArraySize(tradeResults);

   for(int i=0; i<ArraySize(tradeResults); i++)
     {
      if(tradeResults[i] > 0)
         winsTotal++;
     }
   
   return (double)winsTotal/ArraySize(tradeResults)*100;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CTradingMath::ProfitFactor(double grossProfit,double grossLoss)
  {
   if(grossLoss == 0)
   {
      ErrorHandler.SetError(SDK_ERROR_DIVISION_BY_ZERO);
      return -1;
   }

   if(grossLoss < 0)
      grossLoss *= -1;

   return grossProfit/grossLoss;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CTradingMath::ProfitFactor(double &tradeResults[])
  {
   if(ArraySize(tradeResults) < 1)
   {
      ErrorHandler.SetError(SDK_ERROR_EMPTY_ARRAY);
      return -1;
   }

   double grossProfits = 0;
   double grossLoss = 0;

   for(int i=0; i<ArraySize(tradeResults); i++)
     {
      if(tradeResults[i] > 0)
         grossProfits += tradeResults[i];
      if(tradeResults[i] < 0)
         grossLoss += tradeResults[i];
     }

   if(grossLoss == 0)
   {
      ErrorHandler.SetError(SDK_ERROR_DIVISION_BY_ZERO);
      return -1;
   }

   if(grossLoss < 0)
      grossLoss *= -1;

   return grossProfits/grossLoss;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CTradingMath::ExpectedValue(double &tradeResults[])
  {
   if(ArraySize(tradeResults) < 1)
   {
      ErrorHandler.SetError(SDK_ERROR_EMPTY_ARRAY);
      return -1;
   }

   double winrate = Winrate(tradeResults)/100;
   double averageWin = AverageWin(tradeResults);
   double averageLoss = AverageLoss(tradeResults);

   double EV = (winrate*averageWin)-((1-winrate)*averageLoss);
   return EV;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CTradingMath::Expectation(double &tradeResults[])
  {
   if(ArraySize(tradeResults) < 1)
   {
      ErrorHandler.SetError(SDK_ERROR_EMPTY_ARRAY);
      return -1;
   }

   double averageLoss = AverageLoss(tradeResults)*-1;

   return ExpectedValue(tradeResults)/averageLoss;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CTradingMath::AverageWin(double &tradeResults[])
  {
   if(ArraySize(tradeResults) < 1)
   {
      ErrorHandler.SetError(SDK_ERROR_EMPTY_ARRAY);
      return -1;
   }

   double WinnerPL[];
   int winsCounter = 0;

   for(int i = 0; i < ArraySize(tradeResults); i++)
     {
      if(tradeResults[i] > 0)
        {
         ArrayResize(WinnerPL,ArraySize(WinnerPL)+1);
         WinnerPL[winsCounter] = tradeResults[i];
         winsCounter++;
        }
     }

   if(ArraySize(WinnerPL) <= 0)
     {
       ErrorHandler.SetError(SDK_ERROR_EMPTY_ARRAY);
         return -1;
     }

   return Average(WinnerPL);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CTradingMath::AverageLoss(double &tradeResults[])
  {
   if(ArraySize(tradeResults) < 1)
   {
      ErrorHandler.SetError(SDK_ERROR_EMPTY_ARRAY);
      return -1;
   }

   double LossPL[];
   int lossCounter = 0;

   for(int i = 0; i < ArraySize(tradeResults); i++)
     {
      if(tradeResults[i] < 0)
        {
         ArrayResize(LossPL,ArraySize(LossPL)+1);
         LossPL[lossCounter] = tradeResults[i];
         lossCounter++;
        }
     }

   if(ArraySize(LossPL) <= 0)
     {
         ErrorHandler.SetError(SDK_ERROR_EMPTY_ARRAY);
            return -1;
     }

   return Average(LossPL);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CTradingMath::BiggestWin(double &tradeResults[])
  {
   if(ArraySize(tradeResults) < 1)
   {
      ErrorHandler.SetError(SDK_ERROR_EMPTY_ARRAY);
      return -1;
   }

   double biggestWin = 0;

   for(int i = 0; i < ArraySize(tradeResults); i++)
     {
      if(tradeResults[i] > biggestWin && tradeResults[i] > 0)
        {
         biggestWin = tradeResults[i];
        }
     }

   return biggestWin;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CTradingMath::BiggestLoss(double &tradeResults[])
  {
   if(ArraySize(tradeResults) < 1)
   {
      ErrorHandler.SetError(SDK_ERROR_EMPTY_ARRAY);
      return -1;
   }

   double biggestLoss = 0;

   for(int i = 0; i < ArraySize(tradeResults); i++)
     {
      if(tradeResults[i] < biggestLoss && tradeResults[i] < 0)
        {
         biggestLoss = tradeResults[i];
        }
     }

   return biggestLoss;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CTradingMath::Variance(double &tradeResults[])
{
   if(ArraySize(tradeResults) < 1)
   {
      ErrorHandler.SetError(SDK_ERROR_EMPTY_ARRAY);
      return -1;
   }

   double mean = Average(tradeResults);
   double sum = 0;
   int N = ArraySize(tradeResults);

   for(int i = 0; i < N; i++)
   {
      sum += MathPow(tradeResults[i] - mean, 2);
   }

   double variance = sum / N;

   return variance;
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CTradingMath::StandardDeviation(double &tradeResults[])
  {
   if(ArraySize(tradeResults) < 1)
   {
      ErrorHandler.SetError(SDK_ERROR_EMPTY_ARRAY);
      return -1;
   }

   return MathSqrt(Variance(tradeResults));
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CTradingMath::Average(double &dataSample[])
  {
   if(ArraySize(dataSample) < 1)
      return -1;

   int size = ArraySize(dataSample);
   double sum = 0;

   for(int i = 0; i < ArraySize(dataSample); i++)
     {
      sum += dataSample[i];
     }

   return sum/size;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CTradingMath::Average(int &dataSample[])
  {
   if(ArraySize(dataSample) < 1)
      return -1;

   int size = ArraySize(dataSample);
   int sum = 0;

   for(int i = 0; i < ArraySize(dataSample); i++)
     {
      sum += dataSample[i];
     }

   return (double)sum/size;
  }
//+------------------------------------------------------------------+
