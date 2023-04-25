#include "../../../internal/errorsHandler.mqh"
#include "../common/enumerations.mqh"

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
   int               _ticket;             //Currently selected trade ticket
   int               _magic;              //The magic number
   int               _deviation;          //The max slippage or deviation

   //REQUEST DATA
   int               _request_magic;      // Magic number of the expert
   string            _request_symbol;     // Symbol of the order
   double            _request_volume;     // Volume of the order
   double            _request_price;      // Price of the order
   double            _request_sl;         // SL of the order
   double            _request_tp;         // TP of the order
   int               _request_deviation;  // Deviation of the expert
   ENUM_ORDER_TYPE   _request_type;       // Type of the order
   string            _request_type_description; // Type description of the order
   datetime          _request_expiration; // Expiration of the order
   string            _request_comment;    // Comment of the order

   //RESULT DATA
   int               _result_order;    // Order ticket
   double            _result_volume;   // Volume of the order  (MARKET ONLY)
   double            _result_price;    // Price of the order   (MARKET ONLY)

   //SELECTED DATA
   double            _openPrice;    //The open price
   datetime          _openTime;     //The open time
   datetime          _closeTime;    //The close time
   double            _closePrice;   //The close price
   double            _sl;           //The stop loss
   double            _tp;           //The take profits
   int               _magicNumber;  //The magic number
   double            _lots;         //The lot size
   string            _comment;      //The comment
   int               _type;         //The type
   string            _symbol;       //The symbol

   //PRIVATE METHODS
   void              _FreeSelected();           //Clear the selected trade variables
   void              _FreeRequest_Result();     //Clear the variables of the request & result
   void              _FillSelected(int ticket); //Fill the selected data with the selected order

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
   bool              PositionClose(int ticket, int deviation = 0);                           //Close the specified position from Ticket
   bool              PositionClosePartial(int ticket, double volume, int deviation = 0);     //Close a part of the specified position from Ticket

   //MANAGE ORDERS
   bool              ModifyOrder(int ticket, double price, double sl, double tp, datetime expiration = 0);  // Modify the specified order from Ticket
   bool              DeleteOrder(int ticket);                                                               // Delete the specified order from Ticket

   //REQUESTS
   int               RequestMagic() {return _request_magic;}            // Get the magic number of the expert
   string            RequestSymbol() {return _request_symbol;}          // Get the symbol of the order
   double            RequestVolume() {return _request_volume;}          // Get the volume of the order
   double            RequestPrice() {return _request_price;}            // Get the price of the order
   double            RequestSL() {return _request_sl;}                  // Get the SL of the order
   double            RequestTP() {return _request_tp;}                  // Get the TP of the order
   int               RequestDeviation() {return _request_deviation;}    // Get the deviation of the expert
   ENUM_ORDER_TYPE   RequestType() {return _request_type;}              // Get the type of the order
   string            RequestTypeDescription() {return _request_type_description;}      // Get the type description of the order
   datetime          RequestExpiration() {return _request_expiration;}  // Get the expiration of the order
   string            RequestComment() {return _request_comment;}        // Get the comment of the order

   //RESULT
   int               ResultTicket() {return _result_order;}       // Get the order ticket
   double            ResultVolume() {return _result_volume;}      // Get the volume of the order
   double            ResultPrice() {return _result_price;}        // Get the price of the order
   string            ResultComment() {return _request_comment;}   // Get the comment of the order

   //SELECTED ORDER DETAILS
   string            GetSymbol() {return _symbol;}          //Get the selected trade symbol
   string            GetComment() {return _comment;}        //Get the selected trade comment
   int               GetType() {return _type;}              //Get the selected trade type
   int               GetMagic() {return _magicNumber;}      //Get the selected trade magic number
   double            GetOpenPrice() {return _openPrice;}    //Get the selected trade open price
   double            GetClosePrice() {return _closePrice;}  //Get the selected trade close price
   double            GetStopLoss() {return _sl;}            //Get the selected trade stop loss
   double            GetTakeProfits() {return _tp;}         //Get the selected trade take profits
   double            GetLots() {return _lots;}              //Get the selected trade lot size
   datetime          GetOpenTime() {return _openTime;}      //Get the selected trade open time
   datetime          GetCloseTime() {return _closeTime;}    //Get the selected trade close time
   int               GetTicket() {return _ticket;}          //Get the selected trade ticket
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
//| SELECT A TRADE                                                   |
//+------------------------------------------------------------------+
bool CTrading::Select(int index,int selectMethod = BY_INDEX, int pool = POOL_MAIN)
  {
   bool res = false;
  
   if(selectMethod == BY_INDEX)
     {
      if(pool == POOL_MAIN)
        {
         res = OrderSelect(index,SELECT_BY_POS,MODE_TRADES);

         if(!res)
            return false;

         this._ticket = OrderTicket();
         _FillSelected(OrderTicket());

         return res;
        }

      else
         if(pool == POOL_HISTORY)
           {
            res = OrderSelect(index,SELECT_BY_POS,MODE_HISTORY);

            if(!res)
               return false;

            this._ticket = OrderTicket();
            _FillSelected(OrderTicket());

            return res;
           }

         else
            return false;

     }
   else
      if(selectMethod == BY_TICKET)
        {
         if(pool == POOL_BOTH)
           {
            res = OrderSelect(index,SELECT_BY_TICKET);

            if(!res)
               return false;

            this._ticket = OrderTicket();
            _FillSelected(OrderTicket());
            return res;
           }

         else
            if(pool == POOL_MAIN)
              {
               res = OrderSelect(index, SELECT_BY_TICKET);

               if(!res)
                  return false;

               this._ticket = OrderTicket();
               _FillSelected(OrderTicket());

               if(OrderCloseTime() != 0)
                  return false;

               else
                  return true;
              }

            else
               if(pool == POOL_HISTORY)
                 {
                  res = OrderSelect(index, SELECT_BY_TICKET);

                  if(!res)
                     return false;

                  this._ticket = OrderTicket();
                  _FillSelected(OrderTicket());

                  if(OrderCloseTime() != 0)
                     return true;

                  else
                     return false;
                 }

               else
                  return false;
        }
      else
         return false;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//| RETURN THE TOTAL OF TRADES BASED ON THE GIVEN POOL SETTING       |
//+------------------------------------------------------------------+
int CTrading::TradesTotal(int pool=POOL_MAIN)
  {
   if(pool == POOL_MAIN)
      return OrdersTotal();

   else
      if(pool == POOL_HISTORY)
         return OrdersHistoryTotal();

      else
         if(pool == POOL_BOTH)
            return OrdersTotal() + OrdersHistoryTotal();

         else
            return -1;
  }

//+------------------------------------------------------------------+
//| MARKET BUY                                                       |
//+------------------------------------------------------------------+
bool CTrading::Buy(double volume,string symbol="SYMBOL",double price=0.000000,double sl=0.000000,double tp=0.000000,string comment="")
  {
   _FreeRequest_Result();

   if(symbol == SYMBOL)
      symbol = Symbol();

   _request_volume = volume;
   _request_deviation = _deviation;
   _request_magic = _magic;
   _request_price = 0;
   _request_sl = sl;
   _request_tp = tp;
   _request_symbol = symbol;
   _request_type = OP_BUY;
   _request_type_description = "MARKET_BUY";
   _request_volume = volume;

   int ticket = OrderSend(symbol,OP_BUY,volume,Ask,_deviation,sl,tp,comment,_magic);

   if(ticket == 0)
      return false;

   if(!OrderSelect(ticket, SELECT_BY_TICKET))
      return false;

   _request_price = OrderOpenPrice();
   _result_order = ticket;
   _result_price = OrderOpenPrice();
   _result_volume = OrderLots();

   return true;
  }

//+------------------------------------------------------------------+
//| MARKET SELL                                                      |
//+------------------------------------------------------------------+
bool CTrading::Sell(double volume,string symbol="SYMBOL",double price=0.000000,double sl=0.000000,double tp=0.000000,string comment="")
  {
   _FreeRequest_Result();

   if(symbol == SYMBOL)
      symbol = Symbol();

   _request_volume = volume;
   _request_deviation = _deviation;
   _request_magic = _magic;
   _request_price = 0;
   _request_sl = sl;
   _request_tp = tp;
   _request_symbol = symbol;
   _request_type = OP_SELL;
   _request_type_description = "MARKET_SELL";
   _request_volume = volume;

   int ticket = OrderSend(symbol,OP_SELL,volume,Bid,_deviation,sl,tp,comment,_magic);

   if(ticket == 0)
      return false;

   if(!OrderSelect(ticket, SELECT_BY_TICKET))
      return false;

   _request_price = OrderOpenPrice();
   _result_order = ticket;
   _result_price = OrderOpenPrice();
   _result_volume = OrderLots();

   return true;
  }

//+------------------------------------------------------------------+
//| BUY LIMIT                                                        |
//+------------------------------------------------------------------+
bool CTrading::BuyLimit(double volume,double price,string symbol="SYMBOL",double sl=0.000000,double tp=0.000000,datetime expiration=0,string comment="")
  {
   _FreeRequest_Result();

   if(symbol == SYMBOL)
      symbol = Symbol();

   _request_volume = volume;
   _request_deviation = _deviation;
   _request_magic = _magic;
   _request_price = price;
   _request_sl = sl;
   _request_tp = tp;
   _request_symbol = symbol;
   _request_type = OP_BUYLIMIT;
   _request_type_description = "BUY_LIMIT";
   _request_volume = volume;

   int ticket = OrderSend(symbol,OP_BUYLIMIT,volume,price,_deviation,sl,tp,comment,_magic);

   if(ticket == 0)
      return false;

   if(!OrderSelect(ticket, SELECT_BY_TICKET))
      return false;

   _result_order = ticket;

   return true;
  }

//+------------------------------------------------------------------+
//| SELL LIMIT                                                       |
//+------------------------------------------------------------------+
bool CTrading::SellLimit(double volume,double price,string symbol="SYMBOL",double sl=0.000000,double tp=0.000000,datetime expiration=0,string comment="")
  {
   _FreeRequest_Result();

   if(symbol == SYMBOL)
      symbol = Symbol();

   _request_volume = volume;
   _request_deviation = _deviation;
   _request_magic = _magic;
   _request_price = price;
   _request_sl = sl;
   _request_tp = tp;
   _request_symbol = symbol;
   _request_type = OP_SELLLIMIT;
   _request_type_description = "BUY_LIMIT";
   _request_volume = volume;

   int ticket = OrderSend(symbol,OP_SELLLIMIT,volume,price,_deviation,sl,tp,comment,_magic);

   if(ticket == 0)
      return false;

   if(!OrderSelect(ticket, SELECT_BY_TICKET))
      return false;

   _result_order = ticket;

   return true;
  }

//+------------------------------------------------------------------+
//| BUY STOP                                                         |
//+------------------------------------------------------------------+
bool CTrading::BuyStop(double volume,double price,string symbol="SYMBOL",double sl=0.000000,double tp=0.000000,datetime expiration=0,string comment="")
  {
   _FreeRequest_Result();

   if(symbol == SYMBOL)
      symbol = Symbol();

   _request_volume = volume;
   _request_deviation = _deviation;
   _request_magic = _magic;
   _request_price = price;
   _request_sl = sl;
   _request_tp = tp;
   _request_symbol = symbol;
   _request_type = OP_BUYSTOP;
   _request_type_description = "BUY_STOP";
   _request_volume = volume;

   int ticket = OrderSend(symbol,OP_BUYSTOP,volume,price,_deviation,sl,tp,comment,_magic);

   if(ticket == 0)
      return false;

   if(!OrderSelect(ticket, SELECT_BY_TICKET))
      return false;

   _result_order = ticket;

   return true;
  }

//+------------------------------------------------------------------+
//| SELL STOP                                                        |
//+------------------------------------------------------------------+
bool CTrading::SellStop(double volume,double price,string symbol="SYMBOL",double sl=0.000000,double tp=0.000000,datetime expiration=0,string comment="")
  {
   _FreeRequest_Result();

   if(symbol == SYMBOL)
      symbol = Symbol();

   _request_volume = volume;
   _request_deviation = _deviation;
   _request_magic = _magic;
   _request_price = price;
   _request_sl = sl;
   _request_tp = tp;
   _request_symbol = symbol;
   _request_type = OP_SELLSTOP;
   _request_type_description = "BUY_STOP";
   _request_volume = volume;

   int ticket = OrderSend(symbol,OP_SELLSTOP,volume,price,_deviation,sl,tp,comment,_magic);

   if(ticket == 0)
      return false;

   if(!OrderSelect(ticket, SELECT_BY_TICKET))
      return false;

   _result_order = ticket;

   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CTrading::PositionModify(int ticket,double sl,double tp)
  {
   bool res = OrderModify(ticket,0,sl,tp,0);

   if(!res)
      return false;

   _request_sl = sl;
   _request_tp = tp;

   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CTrading::PositionClose(int ticket,int deviation=0)
  {
   if(!OrderSelect(ticket,SELECT_BY_TICKET))
      return false;

   bool res;

   if(OrderType() == OP_BUY)
      res = OrderClose(ticket,OrderLots(),Bid,deviation);

   else
      if(OrderType() == OP_SELL)
         res = OrderClose(ticket,OrderLots(),Ask,deviation);
      else
         res = false;

   if(!res)
      return false;


   return true;

  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CTrading::PositionClosePartial(int ticket,double volume,int deviation=0)
  {
   if(!OrderSelect(ticket,SELECT_BY_TICKET))
      return false;

   bool res;

   if(OrderType() == OP_BUY)
      res = OrderClose(ticket,volume,Ask,deviation);

   else
      if(OrderType() == OP_SELL)
         res = OrderClose(ticket,volume,Bid,deviation);
      else
         res = false;

   if(!res)
      return false;


   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CTrading::ModifyOrder(int ticket,double price,double sl,double tp,datetime expiration=0)
  {
   bool res = OrderModify(ticket,price,sl,tp,expiration);

   if(!res)
      return false;

   _request_sl = sl;
   _request_tp = tp;
   _request_price = price;

   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CTrading::DeleteOrder(int ticket)
  {
   bool res = OrderDelete(ticket);

   return res;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CTrading::_FillSelected(int ticket)
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
   if(slPips <= 0 || riskInMoney <= 0 || symbol == "")
      return(0);

//--- Calculate the LotSize
   double lotSize = 0;
   double nTickValue = MarketInfo(symbol, MODE_TICKVALUE);
   double moneyAtRisk = riskInMoney;

   if(Digits == 3 || Digits == 5)
      nTickValue *= 10;

   lotSize = moneyAtRisk / (nTickValue * slPips);
   lotSize = MathRound(lotSize / MarketInfo(symbol, MODE_LOTSTEP)) * MarketInfo(symbol, MODE_LOTSTEP);

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
   double nTickValue = MarketInfo(symbol, MODE_TICKVALUE);
   double moneyAtRisk = riskInMoney;

   if(Digits == 3 || Digits == 5)
      nTickValue *= 10;

   lotSize = moneyAtRisk / (nTickValue * slPips);
   lotSize = MathRound(lotSize / MarketInfo(symbol, MODE_LOTSTEP)) * MarketInfo(symbol, MODE_LOTSTEP);

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