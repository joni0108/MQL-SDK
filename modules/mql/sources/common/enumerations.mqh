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

// Mixed
enum ENUM_MIX
{
    PASS_HIGH = 0, // Pass high
    PASS_LOW = 1, // Pass low
    PASS_OPEN = 2, // Pass open
    PASS_CLOSE = 3, // Pass close
    PASS_ALL = 3, // Pass all
};