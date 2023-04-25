# TradingMath Module
This is a module of the Tools package. It will allow you to do some trading and statistic related calculations from some parameters or an array of trading results.

## Installation
If you didn't imported all the SDK or the MQL module, you can import this module using:
```cpp
#include <MQL-SDK/modules/tools/tradingmath.mqh>
```

# Class CTradingMath
## Methods
```cpp
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
```

## Example
```cpp
#include <MQL-SDK/modules/tools/tradingmath.mqh>    //Including the module

//Creating an array with some trading results
double tradesPL[] = {1000, 2000, -500, -150, 1500, 260, 1700};

int OnInit()
{
    //Printing some calculations
    double winrate = Round(TradingMath.Winrate(tradesPL),2);
    double avrWin = TradingMath.AverageWin(tradesPL);
    double avrLoss = TradingMath.AverageLoss(tradesPL);

    Print("The winrate for the sample is: " + winrate);
    Print("The average win is: " + avrWin);
    Print("The average loss is: " + avrLoss);

    return INIT_SUCCEEDED;
}
```


## Errors returned
```cpp
SDK_ERROR_EMPTY_ARRAY - If an array passed as parameter or as the result of a filtering operation (like only wins or only losses) is empty.
SDK_ERROR_DIVISION_BY_ZERO - If one of the parameters that is being used to be divided by is zero. On this case, it will be common in the ProfitFactor method if the AverageLoss is zero.

Notes: If a method returns -1, it means that anything got wrong and the error should be checked.
```