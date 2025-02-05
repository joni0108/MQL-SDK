# Indicators Module
This is a module of the MQL package. It will allow you to get indicators values.

## Installation
If you didn't imported all the SDK or the MQL module, you can import this module using:
```cpp
#include <SDK-MQL/mql/indicators.mqh>
```

# Class CIndicators
This class will handle the indicators. <br>

## Methods Overview
```cpp
double i_MA(<parameters>); //Get the value of the moving average indicator.
double i_ATR(<parameters>); //Get the value of the ATR indicator.
double i_MACD(<parameters>); //Get the value of the MACD indicator.
double i_RSI(<parameters>); //Get the value of the RSI indicator.
double i_SAR(<parameters>); //Get the value of the SAR indicator.
```

## Detailed Class Methods
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

## Example
```cpp
#include <SDK-MQL/mql/indicators> //Include the module

//Use the predefined class name 'Indicator'
double atr_value_5_before = Indicator.i_ATR("BTCUSD",PERIOD_M1,14,5);

//Print the balance
Print("The balance is: " + DoubleToString(atr_value_5_before,2));
```
## Notes
More indicators will be added soon!