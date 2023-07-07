# TimeInput Module
This is a module of the Concepts package. It allows you check if any candle have a candlestick pattern, and some other features.

## Installation
If you didn't imported all the SDK or the MQL module, you can import this module using:
```cpp
#include <MQL-SDK/modules/concepts/candlespatterns.mqh>
```

# Class CMarket
## Methods
```cpp
//Constructor
CCandlesPatterns(ENUM_TIMEFRAMES timeframe, string symbol)  //Must be passed the timeframe and the symbol to use

PATTERNS GetPattern(int index, PATTERNS_TYPE type);                         //Returns the pattern at the specified index and type
bool IsPattern(PATTERNS pattern, int index);                                //Returns true if the pattern is on the specified index
BIAS_TYPE GetBias(PATTERNS pattern);  
```

## Enums
```cpp
//List of patterns
enum PATTERNS
{
//Single Candle Patterns
NO_PATTERN = -1,
DOJI = 0,
CROSS_DOJI = 1,
INVERTED_CROSS_DOJI = 2,
DRAGONFLY_DOJI = 3,
GRAVESTONE_DOJI = 4,
HAMMER = 5,
HANGING_MAN = 6,
INVERTED_HAMMER = 7,
SHOOTING_STAR = 8,

//Double Candle Patterns
BULLISH_ENGULFING = 11,
BEARISH_ENGULFING = 12,
PIERCING_PATTERN = 13,
DARK_CLOUD_COVER = 14,
BULLISH_HARAMI = 15,
BEARISH_HARAMI = 16,
BULLISH_KICKING = 17,
BEARISH_KICKING = 18,

//Triple Candle Patterns
MORNING_STAR = 21,
EVENING_STAR = 22,
BULLISH_ABAONDONED_BABY = 23,
BEARISH_ABAONDONED_BABY = 24,
THREE_WHITE_SOLDIERS = 25,
THREE_BLACK_CROWS = 26,
THREE_INSIDE_UP = 27,
THREE_INSIDE_DOWN = 28,
THREE_OUTSIDE_UP = 29,
THREE_OUTSIDE_DOWN = 30,

//4+ Candle Patterns
BULLISH_TRI_STAR = 31,
BEARISH_TRI_STAR = 32,
BULLISH_BREAKAWAY = 33,
BEARISH_BREAKAWAY = 34,
RISING_THREE_METHODS = 35,
FALLING_THREE_METHODS = 36,
};

//List of patterns types by the number of candles they use
enum PATTERNS_TYPE
{
SINGLE_CANDLE = 0,
DOUBLE_CANDLE = 1,
TRIPLE_CANDLE = 2,
FOUR_OR_MORE_CANDLE = 3,
};

//List of bias types which means expected direction of the next candle
enum BIAS_TYPE
{
BULLISH = 0,
BEARISH = 1,
NEUTRAL = 2,
};
```

## Errors returned
```python
SDK_ERROR_INVALID_PARAMETER - If the parameter is invalid
```