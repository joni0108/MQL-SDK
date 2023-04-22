# Terminal Module
This is a module of the MQL package. It will allow you to import all terminal-related data and operations.

## Installation
If you didn't imported all the SDK or the MQL module, you can import this module using:
```cpp
#include <MQL-SDK/modules/mql/terminal.mqh>
```

# Class CTerminal
## Methods
```cpp
bool InfoBoolean(ENUM_TERMINAL _info); //Get boolean information
int InfoInteger(ENUM_TERMINAL _info); //Get integer information
string InfoString(ENUM_TERMINAL _info); //Get string information
```

## Enums
```cpp
// Terminal related
enum ENUM_TERMINAL
{
    // Integer expected return value
    BUILD = 0, // Build number

    // Boolean expected return value
    CONNECTED = 1, // Connected to the server
    DLLS_ALLOWED = 2, // DLLs allowed
    TRADE_ALLOWED_TERMINAL = 3, // Trade allowed
    EMAIL_ENABLED = 4, // Email enabled
    FTP_ENABLED = 5, // FTP enabled
    NOTIFICATIONS_ENABLED = 6, // Notifications enabled
    MQID_SETTED = 7, // MQID setted

    // String expected return value
    LANGUAGE = 8, // Language
    NAME_TERMINAL = 9, // Terminal Name
    PATH = 10, // Terminal path
    DATA_PATH = 11, // Terminal data path
    COMMON_DATA_PATH = 12, // Terminal common data path
};
```

## Errors returned
```cpp
SDK_ERROR_ENUM_OUT_OF_RANGE - If the ENUM_ACCOUNT value is out of range
```