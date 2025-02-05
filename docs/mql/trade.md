# Trading Module
This is a module of the MQL package. It will allow you to send, modify, and close orders and positions. As well get information about trades in the main or history pool.

## Installation
If you didn't imported all the SDK or the MQL module, you can import this module using:
```cpp
#include <SDK-MQL/mql/trade.mqh>
```

# Class CTrading
This class will handle all the trading operations you need to make <br>

## Class Methods
```cpp
//Class methods
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
   string            GetSymbol();           //Get the selected trade symbol
   string            GetComment();          //Get the selected trade comment
   int               GetType();             //Get the selected trade type
   int               GetMagic();            //Get the selected trade magic number
   double            GetOpenPrice();        //Get the selected trade open price
   double            GetClosePrice();       //Get the selected trade close price
   double            GetStopLoss();         //Get the selected trade stop loss
   double            GetTakeProfits();      //Get the selected trade take profits
   double            GetLots();             //Get the selected trade lot size
   datetime          GetOpenTime();         //Get the selected trade open time
   datetime          GetCloseTime();        //Get the selected trade close time
   double            GetSLPips();           //Get the selected trade stop loss in pips
   double            GetTPPips();           //Get the selected trade take profits in pips
   int               GetDuration(string method); //Get the selected trade duration
   double            GetPL(string method);  //Get the selected trade profit
   double            GetRisk(string method); //Get the selected trade risk
   
   //CALCULATIONS
   double            CalculatePips(string symbol, double price1, double price2);     //Get the pips between two prices
   double            CalculatePipsValue(double lots);                 //Get the pips value of a trade
   double            CalculateLots(double entryPrice, double slPrice, double riskInMoney, string symbol);     //Get the lot size of a trade from prices
   double            CalculateLots(double slPips, double riskInMoney, string symbol);                         //Get the lot size of a trade from pips
```

# Methods Parameters
## Trading.Select()
### index
- The index position or ticket of the trade you want to select

### selectMethod
- `BY_INDEX` - Select the trade by index position
- `BY_TICKET` - Select the trade by ticket

## Trading.GetDuration()
### method
- `S` - Return the duration in seconds
- `M` - Return the duration in minutes
- `H` - Return the duration in hours
- `D` - Return the duration in days
- `W` - Return the duration in weeks

## Trading.GetPL() & Trading.GetRisk()
### method
- `$` - Return the profit in dollars
- `P` - Return the profit in pips
- `R` - Return the profit in ratio
- `%` - Return the profit in percentage

## Example
```cpp
#include <SDK-MQL/mql/trade.mqh> //Include the module

//Creating a class object or...
CTrading trading;

//Use the predefined class name 'Trading'
int OnInit()
{
    //Setup the base parameters
    Trading.SetMagicNumber(1234);
    Trading.SetMaxDeviation(-1);
    
    //Make a market buy with 0.34 lots in the Bitcoin, no stop loss or TP
    Trading.Buy(0.34, "BTCUSD");

    //Save the ticket
    int myTicket = (int)Trading.ResultTicket();
}
```

## Notes
Make sure to use `Trading.Select(<parameters>);` prior to getting old (or unregistered) trades information like you do in MQL4