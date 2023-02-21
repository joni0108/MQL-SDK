// List of all the enumerations used in this SDK

// Account related
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