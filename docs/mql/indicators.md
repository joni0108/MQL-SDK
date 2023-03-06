# CIndicators class
This class will handle the indicators. <br>

## Usage
```cpp
#include <Just_MQL_Framework/main.mqh> //Include the framework

//Use the predefined class name 'Indicator'
double atr_value_5_before = Indicator.i_ATR("BTCUSD",PERIOD_M1,14,5);

//Print the balance
Print("The balance is: " + DoubleToString(atr_value_5_before,2));
```

## Class Methods
```cpp
//Class methods
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
```

## Notes
More indicators will be added soon!