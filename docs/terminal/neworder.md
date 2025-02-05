# NewOrder Module
This is a module of the Terminal package that allows to control the terminal interface from code. You will be able to send manual orders from code with this module.

## Installation
If you didn't imported all the SDK or the Network module, you can import this module using:
```cpp
#include <SDK-MQL/terminal/neworder.mqh>
```

# NewOrder Function
## Parameters
```cpp
string symbol // Symbol name
int type // Order type
double size // Order size
double price // Order price
double sl // Stop loss
double tp // Take profit
string comment // Order comment

//Order Types
0 - BUY
1 - SELL
2 - BUY_LIMIT
3 - SELL_LIMIT
4 - BUY_STOP
5 - SELL_STOP
```

## Example of Usage
```cpp
//Including the module
#include <SDK-MQL/terminal/neworder.mqh>

int OnInit()
{
    //Sending a new order
    NewOrder("EURUSD", 2, 0.01, 1.00000, 0.09000, 1.10000, "My Comment");

    return INIT_SUCCEEDED;
}
```