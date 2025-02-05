# Account Module
This is a module of the MQL package. It will allow you to import all account-related data and operations.

## Installation
If you didn't imported all the SDK or the MQL module, you can import this module using:
```cpp
#include <SDK-MQL/mql/account.mqh>
```

# Class CAccount
## Methods
```cpp
bool InfoBoolean(ENUM_ACCOUNT _info); //Get boolean information
int InfoInteger(ENUM_ACCOUNT _info); //Get integer information
double InfoDouble(ENUM_ACCOUNT _info); //Get double information
string InfoString(ENUM_ACCOUNT _info); //Get string information
```

## Enums
```cpp
enum ENUM_ACCOUNT
{
    // Integer expected return value
    LOGIN = 0, // Account login
    TRADE_MODE = 1, // Trade mode
    LEVERAGE = 2, // Leverage
    LIMIT_ORDERS = 3, // Limit orders

    // Boolean expected return value
    TRADE_ALLOWED_ACCOUNT = 4, // Trade allowed
    TRADE_EXPERTS = 5, // Trade experts

    // Double expected return value
    BALANCE = 6, // Balance
    CREDIT = 7, // Credit
    EQUITY = 8, // Equity
    MARGIN_FREE = 9, // Free margin
    MARGIN = 10, // Margin
    PROFIT = 11, // Profit
    MARGIN_LEVEL = 12, // Margin level

    // String expected return value
    COMPANY = 13, // Company
    NAME = 14, // Name
    SERVER = 15, // Server
    CURRENCY = 16, // Currency
};
```

## Errors returned
```cpp
SDK_ERROR_ENUM_OUT_OF_RANGE - If the ENUM_ACCOUNT value is out of range
```