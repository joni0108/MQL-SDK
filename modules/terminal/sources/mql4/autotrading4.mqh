//+------------------------------------------------------------------+
//|                                                  AutoTrading.mqh |
//|                                   Copyright 2023, Just Up Coding |
//|                                            https://www.justup.us |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, Just Up Coding"
#property link      "https://www.justup.us"
#property strict

#include <WinUser32.mqh>
#import "user32.dll"
int GetAncestor(int, int);
#define MT4_WMCMD_EXPERTS  33020
#import
#define _AUTO_TRADING_TOGGLE_MQL4_VERSION 1.0

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetAutotrading(bool status)
  {
   bool currentStatus = IsTradeAllowed();

   if(currentStatus != status)
     {
      int main = GetAncestor(WindowHandle(Symbol(), Period()), 2/*GA_ROOT*/);
      PostMessageA(main, WM_COMMAND,  MT4_WMCMD_EXPERTS, 0);
     }
  }
//+------------------------------------------------------------------+
