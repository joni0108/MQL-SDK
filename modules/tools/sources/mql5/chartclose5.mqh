//+------------------------------------------------------------------+
//|                                                   ChartClose.mqh |
//|                                   Copyright 2023, Just Up Coding |
//|                                            https://www.justup.us |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, Just Up Coding"
#property link      "https://www.justup.us"
#property strict

//+------------------------------------------------------------------+
//| Closes all the charts open                                       |
//+------------------------------------------------------------------+
void ChartCloseAll(bool closeCurrent, string skipWithComment = NULL)
  {
   for(long ch=ChartFirst(); ch >= 0; ch=ChartNext(ch))
      if(ch!=ChartID())
        {
         if(skipWithComment == NULL)
            ChartClose(ch);
         else
            if(ChartGetString(ch,CHART_COMMENT) != skipWithComment)
               ChartClose(ch);
        }
   if(closeCurrent)
      ChartClose(ChartID());
  }
//+------------------------------------------------------------------+