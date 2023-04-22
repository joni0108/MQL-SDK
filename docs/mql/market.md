# Market Module
This is a module of the MQL package. It will allow you to import all market & symbols related data.

## Installation
If you didn't imported all the SDK or the MQL module, you can import this module using:
```cpp
#include <MQL-SDK/modules/mql/market.mqh>
```

# Class CMarket
## Methods
```cpp
//Setters
void SetSymbol(string symbol) //Set the symbol to use
void SetPeriod(ENUM_TIMEFRAMES period) //Set the period to use

//Getters
string GetSymbol() //Get the symbol to use
ENUM_TIMEFRAMES GetPeriod() //Get the period to use

//Getters - Market Info
int InfoInteger(string symbol, ENUM_SYMBOL info);
    int InfoInteger(ENUM_SYMBOL info);
    bool InfoBoolean(string symbol, ENUM_SYMBOL info);
    bool InfoBoolean(ENUM_SYMBOL info);
    double InfoDouble(string symbol, ENUM_SYMBOL info);
    double InfoDouble(ENUM_SYMBOL info);
    string InfoString(string symbol, ENUM_SYMBOL info);
    string InfoString(ENUM_SYMBOL info);

    double GetHigh(string symbol, ENUM_TIMEFRAMES timeframe, int shift);
    double GetHigh(int shift);
    double GetLow(string symbol, ENUM_TIMEFRAMES timeframe, int shift);
    double GetLow(int shift);
    double GetOpen(string symbol, ENUM_TIMEFRAMES timeframe, int shift);
    double GetOpen(int shift);
    double GetClose(string symbol, ENUM_TIMEFRAMES timeframe, int shift);
    double GetClose(int shift);
    int GetVolume(string symbol, ENUM_TIMEFRAMES timeframe, int shift);
    int GetVolume(int shift);
    datetime GetTime(string symbol, ENUM_TIMEFRAMES timeframe, int shift);
    datetime GetTime(int shift);
    int GetHighest(string symbol, ENUM_TIMEFRAMES timeframe, ENUM_MIX type, int count, int start);
    int GetHighest(ENUM_MIX type, int count, int start);
    int GetLowest(string symbol, ENUM_TIMEFRAMES timeframe, ENUM_MIX type, int count, int start);
    int GetLowest(ENUM_MIX type, int count, int start);
```

## Enums
```cpp
// Symbol related
enum ENUM_SYMBOL
{
    //Integer expected return value
    DIGITS = 0, // Digits after decimal point
    SPREAD = 1, // Spread in points
    STOP_LEVEL = 2, // Stop level in points
    FREEZE_LEVEL = 3, // Freeze level in points

    // Boolean expected return value
    SELECTED_SYMBOL = 4, // Selected symbol
    VISIBLE_SYMBOL = 5, // Visible symbol

    // Double expected return value
    BID = 6, // Bid price - best sell offer
    ASK = 7, // Ask price - best buy offer
    POINT = 8, // Point value in the symbol currency
    TICK_VALUE = 9, // Tick value in the deposit currency
    TICK_SIZE = 10, // Tick size
    VOLUME_MIN = 11, // Minimum volume
    VOLUME_MAX = 12, // Maximum volume
    VOLUME_STEP = 13, // Volume step
    SWAP_LONG = 14, // Swap long
    SWAP_SHORT = 15, // Swap short
    MARGIN_INITIAL = 16, // Initial margin
    MARGIN_MAINTENANCE = 17, // Maintenance margin

    // String expected return value
    CURRENCY_BASE = 18, // Base currency
    CURRENCY_PROFIT = 19, // Profit currency
    CURRENCY_MARGIN = 20, // Margin currency
    DESCRIPTION = 21, // Symbol description
    PATH_IN_TREE = 22, // Symbol path in the Market Watch tree
};
```

## Errors returned
```python
SDK_ERROR_ENUM_OUT_OF_RANGE - If the ENUM_ACCOUNT value is out of range

SDK_ERROR_INVALID_PARAMETER - If the parameter is invalid

SDK_ERROR_UNINITIALIZED_CLASS_MEMBER - If the class member is not initialized
```