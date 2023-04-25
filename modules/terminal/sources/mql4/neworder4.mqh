//+------------------------------------------------------------------+
//|                                                     NewOrder.mqh |
//|                                   Copyright 2023, Just Up Coding |
//|                                            https://www.justup.us |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, Just Up Coding"
#property link      "https://www.justup.us"
#property strict

#import "manual-order.dll"
   bool PlaceOrder(int index, long accnum, string symbol, int type, string lots, string price, string stoploss, string takeprofit, string comment);
   void CloseOrderWindow();
#import

#include <stderror.mqh>
#include <stdlib.mqh>

void NewOrder(string symbol, int type, double size, double price, double sl, double tp, string comment)
{
   int digit = (int)SymbolInfoInteger(symbol, SYMBOL_DIGITS);
   PlaceOrder(GetSymbolIndex(symbol), AccountInfoInteger(ACCOUNT_LOGIN), symbol, type, DoubleToString(size,2), DoubleToString(price,digit), DoubleToString(sl,digit), DoubleToString(tp,digit), comment);
}


int GetSymbolIndex(string symbol){
   int count = -1;
   if(MarketInfo(symbol,MODE_POINT) == 0){
      SymbolSelect(symbol,true);
      CloseOrderWindow();
      Print(symbol + " Symbol does not exist in market watch. Adding..");
      Sleep(500);
   } 

   for(int i=0;i<SymbolsTotal(true);i++)
     {
       if(SymbolInfoInteger(SymbolName(i,true),SYMBOL_TRADE_MODE) != SYMBOL_TRADE_MODE_DISABLED){
         count++; 
         if(SymbolName(i,true) == symbol){
            
            return count;
         }
       }
     }
   return -1;
}