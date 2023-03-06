#include "Mql4InMql5.mqh"

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CIndicators
  {
public:
   //FROM PRICES
   double            i_MA(
      string       symbol,           // symbol
      int          timeframe,        // timeframe
      int          ma_period,        // MA averaging period
      int          ma_shift,         // MA shift
      int          ma_method,        // averaging method
      int          applied_price,    // applied price
      int          shift             // shift
   ); //Moving Average

   double            i_ATR(
      string       symbol,     // symbol
      int          timeframe,  // timeframe
      int          period,     // averaging period
      int          shift       // shift
   ); //Average True Range

   double            i_MACD(
      string       symbol,           // symbol
      int          timeframe,        // timeframe
      int          fast_ema_period,  // Fast EMA period
      int          slow_ema_period,  // Slow EMA period
      int          signal_period,    // Signal line period
      int          applied_price,    // applied price
      int          mode,             // line index
      int          shift             // shift
   ); //Moving Average Convergence & Divergence

   double            i_RSI(
      string       symbol,           // symbol
      int          timeframe,        // timeframe
      int          period,           // period
      int          applied_price,    // applied price
      int          shift             // shift
   ); //Relative Strenght Index

   double            i_SAR(
      string       symbol,            // symbol
      int          timeframe,         // timeframe
      double       step,              // price increment step - acceleration factor
      double       maximum,           // maximum value of step
      int          shift              // shift
   ); //Parabolic Stop and Reverse
  } Indicator;

double CIndicators::i_ATR(string symbol,int timeframe,int period,int shift)
  {
   return iATRMQL4(symbol,timeframe,period,shift);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CIndicators::i_MA(string symbol,int timeframe,int ma_period,int ma_shift,int ma_method,int applied_price,int shift)
  {
   return iMAMQL4(symbol,timeframe,ma_period,ma_shift,ma_method,applied_price,shift);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CIndicators::i_MACD(string symbol,int timeframe,int fast_ema_period,int slow_ema_period,int signal_period,int applied_price,int mode,int shift)
  {
   return iMACDMQL4(symbol,timeframe,fast_ema_period,slow_ema_period,signal_period,applied_price,mode,shift);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CIndicators::i_RSI(string symbol,int timeframe,int period,int applied_price,int shift)
  {
   return iRSIMQL4(symbol,timeframe,period,applied_price,shift);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CIndicators::i_SAR(string symbol,int timeframe,double step,double maximum,int shift)
  {
   return iSARMQL4(symbol,timeframe,step,maximum,shift);
  }
//+------------------------------------------------------------------+