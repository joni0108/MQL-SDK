#include "../../../internal/errorsHandler.mqh"
#include "../common/enumerations.mqh"
#include "trade5_dep.mqh"

/*
   SELECT METHODS:
   BY_INDEX - Index position in the trade pool
   BY_TICKET - Order ticket to select
   POOLS:
   POOL_MAIN - The main trading pool
   POOL_HISTORY - The history pool
   POOL_BOTH - Both pools (only for BY_TICKET selection mode)
*/

//+------------------------------------------------------------------+
//| Class                                                            |
//+------------------------------------------------------------------+
class CTrading
  {
private:
   ulong             _ticket;             //Currently selected trade ticket
   ulong             _magic;              //The magic number
   ulong             _deviation;          //The max slippage or deviation

   //REQUEST DATA
   ulong             _request_magic;      // Magic number of the expert
   string            _request_symbol;     // Symbol of the order
   double            _request_volume;     // Volume of the order
   double            _request_price;      // Price of the order
   double            _request_sl;         // SL of the order
   double            _request_tp;         // TP of the order
   ulong             _request_deviation;  // Deviation of the expert
   ENUM_ORDER_TYPE   _request_type;       // Type of the order
   string            _request_type_description; // Type description of the order
   datetime          _request_expiration; // Expiration of the order
   string            _request_comment;    // Comment of the order

   //RESULT DATA
   ulong             _result_order;    // Order ticket
   double            _result_volume;   // Volume of the order  (MARKET ONLY)
   double            _result_price;    // Price of the order   (MARKET ONLY)

   //SELECTED DATA
   double            _openPrice;    //The open price
   datetime          _openTime;     //The open time
   datetime          _closeTime;    //The close time
   double            _closePrice;   //The close price
   double            _sl;           //The stop loss
   double            _tp;           //The take profits
   ulong             _magicNumber;  //The magic number
   double            _lots;         //The lot size
   string            _comment;      //The comment
   ulong             _type;         //The type
   string            _symbol;       //The symbol

   //PRIVATE METHODS
   void              _FreeSelected();           //Clear the selected trade variables
   void              _FreeRequest_Result();     //Clear the variables of the request & result
   void              _FillSelected(ulong ticket); //Fill the selected data with the selected order
   datetime          _GetCloseTime(ulong ticket);  //Get the close time of a position
   CTrade            trade;


public:
   //SETTERS
   void              SetMagicNumber(int magic) {_magic = magic;}
   void              SetMaxDeviation(int deviation) {_deviation = deviation;}

   //BASE METHODS
   bool              Select(int index, int selectMethod = BY_INDEX, int pool = POOL_MAIN);      //Select a position and updating with it ticket the private ticket variable
   int               TradesTotal(int pool = POOL_MAIN);                                         //Return the amount of orders of the selected pool

   //NEW TRADE METHODS
   bool              Buy(double volume, string symbol = SYMBOL, double price = 0.0, double sl = 0.0, double tp = 0.0, string comment = "");                          // Open a buy order
   bool              Sell(double volume, string symbol = SYMBOL, double price = 0.0, double sl = 0.0, double tp = 0.0, string comment = "");                         // Open a sell order
   bool              BuyLimit(double volume, double price, string symbol = SYMBOL, double sl = 0.0, double tp = 0.0, datetime expiration = 0, string comment = "");  //Open a buy limit order
   bool              SellLimit(double volume, double price, string symbol = SYMBOL, double sl = 0.0, double tp = 0.0, datetime expiration = 0, string comment = ""); //Open a sell limit order
   bool              BuyStop(double volume, double price, string symbol = SYMBOL, double sl = 0.0, double tp = 0.0, datetime expiration = 0, string comment = "");   //Open a buy stop order
   bool              SellStop(double volume, double price, string symbol = SYMBOL, double sl = 0.0, double tp = 0.0, datetime expiration = 0, string comment = "");  //Open a sell stop order

   //MANAGE POSITIONS
   bool              PositionModify(int ticket, double sl, double tp);                                //Modify the specified position from Ticket
   bool              PositionClose(int ticket, int deviation = ULONG_MAX);                           //Close the specified position from Ticket
   bool              PositionClosePartial(int ticket, double volume, int deviation = ULONG_MAX);     //Close a part of the specified position from Ticket

   //MANAGE ORDERS
   bool              ModifyOrder(int ticket, double price, double sl, double tp, datetime expiration = 0);  // Modify the specified order from Ticket
   bool              DeleteOrder(int ticket);                                                               // Delete the specified order from Ticket

   //REQUESTS
   ulong             RequestMagic() {return _request_magic;}            // Get the magic number of the expert
   string            RequestSymbol() {return _request_symbol;}          // Get the symbol of the order
   double            RequestVolume() {return _request_volume;}          // Get the volume of the order
   double            RequestPrice() {return _request_price;}            // Get the price of the order
   double            RequestSL() {return _request_sl;}                  // Get the SL of the order
   double            RequestTP() {return _request_tp;}                  // Get the TP of the order
   ulong             RequestDeviation() {return _request_deviation;}    // Get the deviation of the expert
   ENUM_ORDER_TYPE   RequestType() {return _request_type;}              // Get the type of the order
   string            RequestTypeDescription() {return _request_type_description;}      // Get the type description of the order
   datetime          RequestExpiration() {return _request_expiration;}  // Get the expiration of the order
   string            RequestComment() {return _request_comment;}        // Get the comment of the order

   //RESULT
   ulong             ResultTicket() {return _result_order;}       // Get the order ticket
   double            ResultVolume() {return _result_volume;}      // Get the volume of the order
   double            ResultPrice() {return _result_price;}        // Get the price of the order
   string            ResultComment() {return _request_comment;}   // Get the comment of the order

   //SELECTED ORDER DETAILS
   string            GetSymbol() {return _symbol;}          //Get the selected trade symbol
   string            GetComment() {return _comment;}        //Get the selected trade comment
   ulong             GetType() {return _type;}              //Get the selected trade type
   ulong             GetMagic() {return _magicNumber;}      //Get the selected trade magic number
   double            GetOpenPrice() {return _openPrice;}    //Get the selected trade open price
   double            GetClosePrice() {return _closePrice;}  //Get the selected trade close price
   double            GetStopLoss() {return _sl;}            //Get the selected trade stop loss
   double            GetTakeProfits() {return _tp;}         //Get the selected trade take profits
   double            GetLots() {return _lots;}              //Get the selected trade lot size
   datetime          GetOpenTime() {return _openTime;}      //Get the selected trade open time
   datetime          GetCloseTime() {return _closeTime;}    //Get the selected trade close time
   ulong             GetTicket() {return _ticket;}          //Get the selected trade ticket
   double            GetSLPips();                           //Get the selected trade stop loss in pips
   double            GetTPPips();                           //Get the selected trade take profits in pips
   int               GetDuration(string method);            //Get the selected trade duration
   double            GetPL(string method);                  //Get the selected trade profit
   double            GetRisk(string method);                //Get the selected trade risk

   //CALCULATIONS
   double            CalculatePips(string symbol, double price1, double price2);                            //Get the pips between two prices
   double            CalculatePipsValue(double lots);                                                       //Get the pips value of a trade
   double            CalculateLots(double entryPrice, double slPrice, double riskInMoney, string symbol);   //Get the lot size of a trade from prices
   double            CalculateLots(double slPips, double riskInMoney, string symbol);                       //Get the lot size of a trade from pips

  } Trading;
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CTrading::_FreeRequest_Result(void)
  {
   _request_magic = NULL;
   _request_symbol = NULL;
   _request_volume = NULL;
   _request_price = NULL;
   _request_sl = NULL;
   _request_tp = NULL;
   _request_deviation = NULL;
   _request_type = NULL;
   _request_type_description = NULL;
   _request_expiration = NULL;
   _request_comment = NULL;

//RESULT DATA
   _result_order = NULL;
   _result_volume = NULL;
   _result_price = NULL;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CTrading::_FreeSelected(void)
  {
   _openPrice = NULL;
   _openTime = NULL;
   _closeTime = NULL;
   _closePrice = NULL;
   _sl = NULL;
   _tp = NULL;
   _magicNumber = NULL;
   _lots = NULL;
   _comment = NULL;
   _type = NULL;
   _symbol = NULL;

   _ticket = NULL;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CTrading::Select(int index,int selectMethod=0,int pool=0)
  {
   if(selectMethod == BY_INDEX)
     {
      if(pool == POOL_MAIN)
        {
         if(!OrderSelect(index, SELECT_BY_POS))
            return false;
            
         ulong ticket = OrderTicket();

         if(ticket == 0)
            return false;

         if(_GetCloseTime(ticket) != 0)
            return false;

         _ticket = ticket;

         _FillSelected(_ticket);

         return true;
        }

      else
         if(pool == POOL_HISTORY)
           {
            if(!OrderSelect(index, SELECT_BY_POS))
            return false;
            
            ulong ticket = OrderTicket();
            
            if(ticket == 0)
               return false;

            if(_GetCloseTime(ticket) == 0)
               return false;

            _ticket = ticket;

            _FillSelected(_ticket);

            return true;
           }

         else
            return false;
     }

   else
      if(selectMethod == BY_TICKET)
        {
         if(pool == POOL_BOTH)
           {
            if(!OrderSelect(index, SELECT_BY_TICKET))
               return false;

            _ticket = index;

            _FillSelected(index);

            return true;
           }

         else
            if(pool == POOL_MAIN)
              {
               if(!OrderSelect(index, SELECT_BY_TICKET))
                  return false;

               if(_GetCloseTime(index) != 0)
                  return false;

               _ticket = index;

               _FillSelected(index);

               return true;
              }

            else
               if(pool == POOL_HISTORY)
                 {
                  if(!OrderSelect(index, SELECT_BY_TICKET))
                     return false;

                  if(_GetCloseTime(index) == 0)
                     return false;

                  _ticket = index;

                  _FillSelected(index);

                  return true;
                 }
        }

   return false;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
datetime CTrading::_GetCloseTime(ulong ticket)
  {
   return((HistoryOrderGetInteger(ticket, ORDER_TICKET) == ticket) || HistoryOrderSelect(ticket) ? (datetime)HistoryOrderGetInteger(ticket, ORDER_TIME_DONE) : 0);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int CTrading::TradesTotal(int pool=POOL_MAIN)
  {
   if(pool == POOL_MAIN)
      return OrdersTotal();

   else
      if(pool == POOL_HISTORY)
         return HistoryOrdersTotal();

      else
         if(pool == POOL_BOTH)
            return OrdersTotal() + HistoryOrdersTotal();
         else
            return -1;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CTrading::Buy(double volume,string symbol="SYMBOL",double price=0.000000,double sl=0.000000,double tp=0.000000,string comment="")
  {
   trade.SetExpertMagicNumber(_magic);
   trade.SetDeviationInPoints(_deviation);

   if(symbol == SYMBOL)
      symbol = Symbol();

   _request_volume = volume;
   _request_deviation = _deviation;
   _request_magic = _magic;
   _request_price = 0;
   _request_sl = sl;
   _request_tp = tp;
   _request_symbol = symbol;
   _request_type = MARKET_BUY;
   _request_type_description = "MARKET_BUY";
   _request_volume = volume;

   trade.Buy(volume,symbol, price, sl, tp, comment);

   _result_order = trade.ResultOrder();
   _result_price = trade.ResultPrice();
   _result_volume = trade.ResultVolume();
   _request_price = _result_price;

   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CTrading::Sell(double volume,string symbol="SYMBOL",double price=0.000000,double sl=0.000000,double tp=0.000000,string comment="")
  {
   trade.SetExpertMagicNumber(_magic);
   trade.SetDeviationInPoints(_deviation);

   if(symbol == SYMBOL)
      symbol = Symbol();

   _request_volume = volume;
   _request_deviation = _deviation;
   _request_magic = _magic;
   _request_price = 0;
   _request_sl = sl;
   _request_tp = tp;
   _request_symbol = symbol;
   _request_type = MARKET_SELL;
   _request_type_description = "MARKET_SELL";
   _request_volume = volume;

   if(!trade.Sell(volume,symbol, price, sl, tp, comment))
      return false;

   _result_order = trade.ResultOrder();
   _result_price = trade.ResultPrice();
   _result_volume = trade.ResultVolume();
   _request_price = _result_price;

   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CTrading::BuyLimit(double volume,double price,string symbol="SYMBOL",double sl=0.000000,double tp=0.000000,datetime expiration=0,string comment="")
  {
   trade.SetExpertMagicNumber(_magic);
   trade.SetDeviationInPoints(_deviation);

   if(symbol == SYMBOL)
      symbol = Symbol();

   _request_volume = volume;
   _request_deviation = _deviation;
   _request_magic = _magic;
   _request_price = 0;
   _request_sl = sl;
   _request_tp = tp;
   _request_symbol = symbol;
   _request_type = BUY_LIMIT;
   _request_type_description = "BUY_LIMIT";
   _request_volume = volume;

   if(!trade.BuyLimit(volume,price,symbol,sl,tp,ORDER_TIME_DAY,expiration,comment))
      return false;

   _result_order = trade.ResultOrder();
   _result_price = trade.ResultPrice();
   _result_volume = trade.ResultVolume();
   _request_price = _result_price;

   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CTrading::SellLimit(double volume,double price,string symbol="SYMBOL",double sl=0.000000,double tp=0.000000,datetime expiration=0,string comment="")
  {
   trade.SetExpertMagicNumber(_magic);
   trade.SetDeviationInPoints(_deviation);

   if(symbol == SYMBOL)
      symbol = Symbol();

   _request_volume = volume;
   _request_deviation = _deviation;
   _request_magic = _magic;
   _request_price = 0;
   _request_sl = sl;
   _request_tp = tp;
   _request_symbol = symbol;
   _request_type = SELL_LIMIT;
   _request_type_description = "SELL_LIMIT";
   _request_volume = volume;

   if(!trade.SellLimit(volume,price,symbol,sl,tp,ORDER_TIME_DAY,expiration,comment))
      return false;

   _result_order = trade.ResultOrder();
   _result_price = trade.ResultPrice();
   _result_volume = trade.ResultVolume();
   _request_price = _result_price;

   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CTrading::BuyStop(double volume,double price,string symbol="SYMBOL",double sl=0.000000,double tp=0.000000,datetime expiration=0,string comment="")
  {
   trade.SetExpertMagicNumber(_magic);
   trade.SetDeviationInPoints(_deviation);

   if(symbol == SYMBOL)
      symbol = Symbol();

   _request_volume = volume;
   _request_deviation = _deviation;
   _request_magic = _magic;
   _request_price = 0;
   _request_sl = sl;
   _request_tp = tp;
   _request_symbol = symbol;
   _request_type = BUY_STOP;
   _request_type_description = "BUY_STOP";
   _request_volume = volume;

   if(!trade.BuyStop(volume,price,symbol,sl,tp,ORDER_TIME_DAY,expiration,comment))
      return false;

   _result_order = trade.ResultOrder();
   _result_price = trade.ResultPrice();
   _result_volume = trade.ResultVolume();
   _request_price = _result_price;

   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CTrading::SellStop(double volume,double price,string symbol="SYMBOL",double sl=0.000000,double tp=0.000000,datetime expiration=0,string comment="")
  {
   trade.SetExpertMagicNumber(_magic);
   trade.SetDeviationInPoints(_deviation);

   if(symbol == SYMBOL)
      symbol = Symbol();

   _request_volume = volume;
   _request_deviation = _deviation;
   _request_magic = _magic;
   _request_price = 0;
   _request_sl = sl;
   _request_tp = tp;
   _request_symbol = symbol;
   _request_type = SELL_STOP;
   _request_type_description = "SELL_STOP";
   _request_volume = volume;

   if(!trade.SellStop(volume,price,symbol,sl,tp,ORDER_TIME_DAY,expiration,comment))
      return false;

   _result_order = trade.ResultOrder();
   _result_price = trade.ResultPrice();
   _result_volume = trade.ResultVolume();
   _request_price = _result_price;

   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CTrading::PositionModify(int ticket,double sl,double tp)
  {
   if(!trade.PositionModify(ticket,sl,tp))
      return false;

   _request_sl = sl;
   _request_tp = tp;

   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CTrading::PositionClose(int ticket,int deviation=-1)
  {
   trade.SetDeviationInPoints(_deviation);

   if(!trade.PositionClose(ticket,deviation))
      return false;

   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CTrading::PositionClosePartial(int ticket,double volume,int deviation=-1)
  {
   trade.SetDeviationInPoints(_deviation);

   if(!trade.PositionClosePartial(ticket, volume, deviation))
      return false;

   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CTrading::ModifyOrder(int ticket,double price,double sl,double tp,datetime expiration=0)
  {
   if(!trade.OrderModify(ticket,price,sl,tp,ORDER_TIME_DAY,expiration))
      return false;

   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CTrading::DeleteOrder(int ticket)
  {
   if(!trade.OrderDelete(ticket))
      return false;

   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CTrading::_FillSelected(ulong ticket)
  {
   _FreeSelected();

   if(!OrderSelect(ticket,SELECT_BY_TICKET))
      return;
    
   _openPrice = OrderOpenPrice();
   _openTime = OrderOpenTime();
   _closeTime = OrderCloseTime();
   _closePrice = OrderClosePrice();
   _sl = OrderStopLoss();
   _tp = OrderTakeProfit();
   _magicNumber = OrderMagicNumber();
   _lots = OrderLots();
   _comment = OrderComment();
   _type = OrderType();
   _symbol = OrderSymbol();


   _ticket = ticket;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CTrading::CalculatePips(string symbol, double price1, double price2)
  {
   double diff;

   if(price1 == price2)
      return 0;

   if(price1 > price2)
     {
      diff = price1 - price2;
     }
   else
     {
      diff = price2 - price1;
     }

// If there are 3 or fewer digits (JPY, for example), then return 0.01, which is the pip value.
   if(SymbolInfoInteger(symbol,SYMBOL_DIGITS) <= 3)
     {
      return diff * 100;
     }
// If there are 4 or more digits, then return 0.0001, which is the pip value.
   else
      if(SymbolInfoInteger(symbol,SYMBOL_DIGITS) >= 4)
        {
         return diff * 10000;
        }
      else
         return 0;

   return 0;
  }
  
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CTrading::CalculatePipsValue(double lots)
  {
   return lots * 10;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CalculateDigits(string symbol)
  {
// If there are 3 or fewer digits (JPY, for example), then return 0.01, which is the pip value.
   if(SymbolInfoInteger(symbol,SYMBOL_DIGITS) <= 3)
     {
      return(0.01);
     }
// If there are 4 or more digits, then return 0.0001, which is the pip value.
   else
      if(SymbolInfoInteger(symbol,SYMBOL_DIGITS) >= 4)
        {
         return(0.0001);
        }
      // In all other cases, return 0.
      else
         return(0);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CTrading::CalculateLots(double slPips,double riskInMoney, string symbol)
  {
//--- Verify the input parameters
   if(slPips <= 0 || riskInMoney <= 0)
      return(0);

   if(symbol == SYMBOL)
      symbol = Symbol();

//--- Calculate the LotSize
   double lotSize = 0;
   double nTickValue = SymbolInfoDouble(symbol, SYMBOL_TRADE_TICK_VALUE);
   double moneyAtRisk = riskInMoney;

   if(Digits() == 3 || Digits() == 5)
      nTickValue *= 10;

   lotSize = moneyAtRisk / (nTickValue * slPips);
   lotSize = MathRound(lotSize / SymbolInfoDouble(symbol, SYMBOL_VOLUME_STEP)) * SymbolInfoDouble(symbol, SYMBOL_VOLUME_STEP);

   return lotSize; 
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CTrading::CalculateLots(double entryPrice,double slPrice,double riskInMoney,string symbol)
  {
//--- Verify the input parameters
   if(riskInMoney <= 0 || symbol == "" || entryPrice <=0 || slPrice <=0)
      return(0);

   double slPips = CalculatePips(symbol, entryPrice, slPrice);

//--- Calculate the LotSize
   double lotSize = 0;
   double nTickValue = SymbolInfoDouble(symbol, SYMBOL_TRADE_TICK_VALUE);
   double moneyAtRisk = riskInMoney;

   if(Digits() == 3 || Digits() == 5)
      nTickValue *= 10;

   lotSize = moneyAtRisk / (nTickValue * slPips);
   lotSize = MathRound(lotSize / SymbolInfoDouble(symbol, SYMBOL_VOLUME_STEP)) * SymbolInfoDouble(symbol, SYMBOL_VOLUME_STEP);

   return lotSize;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CTrading::GetSLPips(void)
  {
   return CalculatePips(GetSymbol(), GetOpenPrice(), GetStopLoss());
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CTrading::GetTPPips(void)
  {
   return CalculatePips(GetSymbol(), GetOpenPrice(), GetTakeProfits());
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int CTrading::GetDuration(string method)
  {
   if(GetCloseTime() == 0)
      return -1;

   datetime diff = GetCloseTime() - GetOpenTime();
   int durationInSeconds = (int)diff;

   if(method == "S")
      return durationInSeconds;

   if(method == "M")
      return durationInSeconds / 60;

   if(method == "H")
      return durationInSeconds / 60 / 60;

   if(method == "D")
      return durationInSeconds / 60 / 60 / 24;

   if(method == "W")
      return durationInSeconds / 60 / 60 / 24 / 7;

   else
      return -1;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CTrading::GetPL(string method)
  {
   if(OrderSelect(_ticket,SELECT_BY_TICKET))
      return -1;

   if(GetCloseTime() == 0)
      return -1;

   double pl = OrderProfit();

   if(method == "$")
      return pl;

   if(method == "%")
      return pl / AccountInfoDouble(ACCOUNT_BALANCE) * 100;

   if(method == "P")
     {
      double pips = CalculatePips(GetSymbol(),GetClosePrice(),GetOpenPrice());

      if(GetClosePrice() < GetOpenPrice() && pips > 0)
         return -pips;
     }

   if(method == "R")
     {
      if(GetClosePrice() < GetOpenPrice())
         return -1;

      double slPips = CalculatePips(GetSymbol(),GetOpenPrice(),GetStopLoss());
      double plPips = CalculatePips(GetSymbol(),GetClosePrice(),GetOpenPrice());

      return NormalizeDouble(plPips / slPips,1);
     }
   else
      return -1;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CTrading::GetRisk(string method)
  {
   if(OrderSelect(_ticket,SELECT_BY_TICKET))
      return -1;

   if(GetStopLoss() == 0)
      return -1;

   if(method == "$")
     {
      return CalculatePips(GetSymbol(),GetOpenPrice(),GetStopLoss()) * GetLots() * 10;
     }

   if(method == "%")
      return CalculatePips(GetSymbol(),GetOpenPrice(),GetStopLoss()) * GetLots() * 10 / AccountInfoDouble(ACCOUNT_BALANCE) * 100;

   if(method == "P")
     {
      double pips = CalculatePips(GetSymbol(),GetOpenPrice(),GetStopLoss());

      return pips;
     }

   if(method == "R")
     {
      return 1;
     }
   else
      return -1;
  }