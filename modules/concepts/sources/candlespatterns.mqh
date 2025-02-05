#include "../../internal/errorsHandler.mqh"
#include "../../mql/market.mqh"
#include "../../mql/sources/common/enumerations.mqh"

class CCandlesPatterns
{
private:
ENUM_TIMEFRAMES _timeframe;
string _symbol;

public:
CCandlesPatterns(ENUM_TIMEFRAMES timeframe, string symbol)
{
    _timeframe = timeframe;
    _symbol = symbol;
}

/*
RULES:
-1: No Pattern
0-10: Single Candle Patterns
11-20: Double Candle Patterns
21-30: Triple Candle Patterns
31-40: 4+ Candle Patterns

0 - Doji (Neutral)
Any Odd Number: Bullish (undivisible by 2)
Any Even Number: Bearish (divisible by 2)
*/
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

enum PATTERNS_TYPE
{
SINGLE_CANDLE = 0,
DOUBLE_CANDLE = 1,
TRIPLE_CANDLE = 2,
FOUR_OR_MORE_CANDLE = 3,
};

enum BIAS_TYPE
{
BULLISH = 0,
BEARISH = 1,
NEUTRAL = 2,
};

int GetPattern(int index, PATTERNS_TYPE type);                         //Returns the pattern at the specified index and type
bool IsPattern(PATTERNS pattern, int index);                                //Returns true if the pattern is on the specified index
int GetBias(PATTERNS pattern);                                        //Returns the bias at the specified index
};

int CCandlesPatterns::GetPattern(int index, PATTERNS_TYPE type)
{
    if(index < 0)
    {
        ErrorHandler.SetError(SDK_ERROR_INVALID_PARAMETER);
        return NO_PATTERN;
    }
    
        double open0 = Market.GetOpen(_symbol, _timeframe, index);
        double close0 = Market.GetClose(_symbol, _timeframe, index);
        double high0 = Market.GetHigh(_symbol, _timeframe, index);
        double low0 = Market.GetLow(_symbol, _timeframe, index);
        double half0 = (high0 - low0) / 2;

        double open1 = Market.GetOpen(_symbol, _timeframe, index-1);
        double close1 = Market.GetClose(_symbol, _timeframe, index-1);
        double high1 = Market.GetHigh(_symbol, _timeframe, index-1);
        double low1 = Market.GetLow(_symbol, _timeframe, index-1);
        double half1 = (high1 - low1) / 2;

        double open2 = Market.GetOpen(_symbol, _timeframe, index-2);
        double close2 = Market.GetClose(_symbol, _timeframe, index-2);
        double high2 = Market.GetHigh(_symbol, _timeframe, index-2);
        double low2 = Market.GetLow(_symbol, _timeframe, index-2);
        double half2 = (high2 - low2) / 2;

        double open3 = Market.GetOpen(_symbol, _timeframe, index-3);
        double close3 = Market.GetClose(_symbol, _timeframe, index-3);
        double high3 = Market.GetHigh(_symbol, _timeframe, index-3);
        double low3 = Market.GetLow(_symbol, _timeframe, index-3);
        double half3 = (high3 - low3) / 2;

        double open4 = Market.GetOpen(_symbol, _timeframe, index-4);
        double close4 = Market.GetClose(_symbol, _timeframe, index-4);
        double high4 = Market.GetHigh(_symbol, _timeframe, index-4);
        double low4 = Market.GetLow(_symbol, _timeframe, index-4);
        double half4 = (high4 - low4) / 2;

    if(type == SINGLE_CANDLE)
    {
        if(open0 == close0 && open0 == high0)
            return DRAGONFLY_DOJI;

        if(open0 == close0 && open0 == low0)
            return GRAVESTONE_DOJI;
        
        if(open0 == close0 && high0 > half0)
            return CROSS_DOJI;

        if(open0 == close0 && low0 < half0)
            return INVERTED_CROSS_DOJI;

        if(open0 == close0)
            return DOJI;

        if(close0 > open0 && open0 > half0)
            return HAMMER;
        
        if(close0 > open0 && open0 < half0)
            return INVERTED_HAMMER;
        
        if(close0 < open0 && close0 > half0)
            return HANGING_MAN;

        if(close0 < open0 && close0 < half0)
            return SHOOTING_STAR;

        return NO_PATTERN;
    }

    else if(type == DOUBLE_CANDLE)
    {
        if(close0 > open0 && close1 < open1 && close0 > open1 && open0 <= close1)
            return BULLISH_ENGULFING;

        if(close0 < open0 && close1 > open1 && close0 < open1 && open0 >= close1)
            return BEARISH_ENGULFING;

        if(close0 > open0 && close1 < open1 && close0 < open1 && open0 < close1)
            return PIERCING_PATTERN;
        
        if(close0 < open0 && close1 > open1 && close0 > open1 && open0 > close1)
            return DARK_CLOUD_COVER;
        
        if(close0 > open0 && close1 < open1 && close0 < open1 && open0 > close1)
            return BULLISH_HARAMI;
        
        if(close0 < open0 && close1 > open1 && close0 > open1 && open0 < close1)
            return BEARISH_HARAMI;
        
        if(close0 > open0 && close1 > open1 && close0 > high1 && open0 > open1)
            return BULLISH_KICKING;
        
        if(close0 < open0 && close1 < open1 && close0 < low1 && open0 < open1)
            return BEARISH_KICKING;
        
        return NO_PATTERN;
    }

    else if(type == TRIPLE_CANDLE)
    {
        if(close0 > open0 && close1 > open1 && close2 < open2 && close1 < close2 && close1 < open0)
            return MORNING_STAR;
        
        if(close0 < open0 && close1 < open1 && close2 > open2 && close1 > close2 && close1 > open0)
            return EVENING_STAR;

        if(close0 > open0 && close1 == open1 && close2 < open2 && high1 < low2 && high1 < low0)
            return BULLISH_ABAONDONED_BABY;
        
        if(close0 < open0 && close1 == open1 && close2 > open2 && high1 > low2 && high1 > low0)
            return BEARISH_ABAONDONED_BABY;
        
        if(close0 > open0 && close1 > open1 && close2 > open2 && open0 < close1 && low0 < open1 && open1 < close2 && low1 < open2)
            return THREE_WHITE_SOLDIERS;
        
        if(close0 < open0 && close1 < open1 && close2 < open2 && open0 > close1 && high0 > open1 && open1 > close2 && high1 > open2)
            return THREE_BLACK_CROWS;

        if(close0 > open0 && close1 > open1 && close2 < open2 && high1 < open2 && low1 > close2 && close0 > high2)
            return THREE_INSIDE_UP;
        
        if(close0 < open0 && close1 < open1 && close2 > open2 && high1 > open2 && low1 < close2 && close0 < low2)
            return THREE_INSIDE_DOWN;
        
        if(close0 > open0 && close1 > open1 && close2 < open2 && close0 > high1 && high2 < close1 && low2 > open1)
            return THREE_OUTSIDE_UP;
        
        if(close0 < open0 && close1 < open1 && close2 > open2 && close0 < low1 && low2 > close1 && high2 < open1)
            return THREE_OUTSIDE_DOWN;

        return NO_PATTERN;
    }

    else if(type == FOUR_OR_MORE_CANDLE)
    {
        if(close0 == open0 && close1 == open1 && close2 == open2 && close3 < open3 && high0 > high1 && low1 < low2 && low2 < low3)
            return BULLISH_TRI_STAR;
        
        if(close0 == open0 && close1 == open1 && close2 == open2 && close3 > open3 && high0 < high1 && low1 > low2 && low2 > low3)
            return BEARISH_TRI_STAR;

        if(close0 > open0 && close1 < open1 && close2 < open2 && close3 < open3 && close4 < open4 && close0 > open3 && low0 > low1 && low1 < low2 && low2 < low3 && low3 < low4)
            return BULLISH_BREAKAWAY;

        if(close0 < open0 && close1 > open1 && close2 > open2 && close3 > open3 && close4 > open4 && close0 < open3 && high0 < high1 && high1 > high2 && high2 > high3 && high3 > high4)
            return BEARISH_BREAKAWAY;
        
        if(close0 > open0 && close1 < open1 && close2 < open2 && close3 < open3 && close4 > open4 && close0 > open3 && low1 < low2 && low2 < low3 && low4 < low0)
            return RISING_THREE_METHODS;
        
        if(close0 < open0 && close1 > open1 && close2 > open2 && close3 > open3 && close4 < open4 && close0 < open3 && high1 > high2 && high2 > high3 && high4 > high0)
            return FALLING_THREE_METHODS;

        return NO_PATTERN;
    }

    else
    {
        return NO_PATTERN;
    }
};

bool CCandlesPatterns::IsPattern(PATTERNS pattern, int index)
{
    if(index <0)
    {
        ErrorHandler.SetError(SDK_ERROR_INVALID_PARAMETER);
        return false;
    }

    if(pattern <= 10)
    {
        if(GetPattern(index, SINGLE_CANDLE) == pattern)
            return true;
        else
            return false;
    }
    if(pattern <= 20)
    {
        if(GetPattern(index, DOUBLE_CANDLE) == pattern)
            return true;
        else
            return false;
    }
    if(pattern <= 30)
    {
        if(GetPattern(index, TRIPLE_CANDLE) == pattern)
            return true;
        else
            return false;
    }
    if(pattern <= 40)
    {
        if(GetPattern(index, FOUR_OR_MORE_CANDLE) == pattern)
            return true;
        else
            return false;
    }
    else
    {
        ErrorHandler.SetError(SDK_ERROR_INVALID_PARAMETER);
        return false;
    }
};

int CCandlesPatterns::GetBias(PATTERNS pattern)
{
    if(pattern == 0)
        return NEUTRAL;
    if(pattern % 2 == 0)
        return BEARISH;
    else
        return BULLISH;
};