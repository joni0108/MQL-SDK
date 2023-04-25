# AutoTrading Module
This is a module of the Terminal package that allows to control the terminal interface from code. You will be able to toggle the AutoTrading button from code.

## Installation
If you didn't imported all the SDK or the Network module, you can import this module using:
```cpp
#include <MQL-SDK/modules/terminal/autotrading.mqh>
```

# SetAutotrading Function
## Parameters
```cpp
bool status // Status of the AutoTrading button
```

It will only click on it if the current status is different from the one passed as parameter.

## Example of Usage
```cpp
//Including the module
#include <MQL-SDK/modules/terminal/autotrading.mqh>

int OnInit()
{
    //Set the AutoTrading button to true
    SetAutoTrading(true);

    return INIT_SUCCEEDED;
}
```