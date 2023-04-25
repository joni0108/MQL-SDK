# OneClick Module
This is a module of the Terminal package that allows to control the terminal interface from code. You will be able to send market orders using the One Click Trading panel from code.

## Installation
If you didn't imported all the SDK or the Network module, you can import this module using:
```cpp
#include <MQL-SDK/modules/terminal/oneclick.mqh>
```

# COneClickTradingWindow Class
## Methods
```cpp
void ClickBuy() //Clicks the Buy button
void ClickSell() //Clicks the Sell button
void SetLots(double lots) //Sets the lots value
```

It will execute the orders in the symbol of the chart where the EA is running or the code is called from.

## Example of Usage
```cpp
//Including the module
#include <MQL-SDK/modules/terminal/oneclick.mqh>

int OnInit()
{
    //Set the lots to 0.05
    OCT.SetLots(0.05);

    //Click the Buy button
    OCT.ClickBuy();

    return INIT_SUCCEEDED;
}
```