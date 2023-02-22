#include "../common/errorsHandler.mqh"
#include "../common/enumerations.mqh"

class CMarket
{
private:
    string _symbol;
    ENUM_TIMEFRAMES _timeframe;

public:
    CMarket() {}

    //Setters
    void SetSymbol(string symbol) { this._symbol = symbol; }
    void SetTimeframe(ENUM_TIMEFRAMES timeframe) { this._timeframe = timeframe; }

    //Getters
    string GetSymbol() { return this._symbol; }
    ENUM_TIMEFRAMES GetTimeframe() { return this._timeframe; }
    
    //Methods
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


} Market;

int CMarket::InfoInteger(string symbol, ENUM_SYMBOL info)
{
    if(symbol == "")
    {
        ErrorHandler.SetError(SDK_ERROR_INVALID_PARAMETER);
        ErrorHandler.PrintErrorMessage();
        return -1;
    }

    switch (info)
    {
    case DIGITS:
        return SymbolInfoInteger(symbol, SYMBOL_DIGITS);
    case SPREAD:
        return SymbolInfoInteger(symbol, SYMBOL_SPREAD);
    case STOP_LEVEL:
        return SymbolInfoInteger(symbol, SYMBOL_TRADE_STOPS_LEVEL);
    case FREEZE_LEVEL:
        return SymbolInfoInteger(symbol, SYMBOL_TRADE_FREEZE_LEVEL);
    }

    return -1;
}

bool CMarket::InfoBoolean(string symbol, ENUM_SYMBOL info)
{
    if(symbol == "")
    {
        ErrorHandler.SetError(SDK_ERROR_INVALID_PARAMETER);
        ErrorHandler.PrintErrorMessage();
        return false;
    }

    switch (info)
    {
    case SELECTED_SYMBOL:
        return SymbolInfoInteger(symbol, SYMBOL_SELECT) == 1;
    case VISIBLE_SYMBOL:
        return SymbolInfoInteger(symbol, SYMBOL_VISIBLE) == 1;
    }

    return false;
}

double CMarket::InfoDouble(string symbol, ENUM_SYMBOL info)
{
    if(symbol == "")
    {
        ErrorHandler.SetError(SDK_ERROR_INVALID_PARAMETER);
        ErrorHandler.PrintErrorMessage();
        return -1;
    }

    switch (info)
    {
    case BID:
        return SymbolInfoDouble(symbol, SYMBOL_BID);
    case ASK:
        return SymbolInfoDouble(symbol, SYMBOL_ASK);
    case POINT:
        return SymbolInfoDouble(symbol, SYMBOL_POINT);
    case TICK_VALUE:
        return SymbolInfoDouble(symbol, SYMBOL_TRADE_TICK_VALUE);
    case TICK_SIZE:
        return SymbolInfoDouble(symbol, SYMBOL_TRADE_TICK_SIZE);
    case VOLUME_MIN:
        return SymbolInfoDouble(symbol, SYMBOL_VOLUME_MIN);
    case VOLUME_MAX:
        return SymbolInfoDouble(symbol, SYMBOL_VOLUME_MAX);
    case VOLUME_STEP:
        return SymbolInfoDouble(symbol, SYMBOL_VOLUME_STEP);
    case SWAP_LONG:
        return SymbolInfoDouble(symbol, SYMBOL_SWAP_LONG);
    case SWAP_SHORT:
        return SymbolInfoDouble(symbol, SYMBOL_SWAP_SHORT);
    case MARGIN_INITIAL:
        return SymbolInfoDouble(symbol, SYMBOL_MARGIN_INITIAL);
    case MARGIN_MAINTENANCE:
        return SymbolInfoDouble(symbol, SYMBOL_MARGIN_MAINTENANCE);
    }

    return -1;
}

string CMarket::InfoString(string symbol, ENUM_SYMBOL info)
{
    if(symbol == "")
    {
        ErrorHandler.SetError(SDK_ERROR_INVALID_PARAMETER);
        ErrorHandler.PrintErrorMessage();
        return "";
    }

    switch (info)
    {
    case DESCRIPTION:
        return SymbolInfoString(symbol, SYMBOL_DESCRIPTION);
    case CURRENCY_BASE:
        return SymbolInfoString(symbol, SYMBOL_CURRENCY_BASE);
    case CURRENCY_PROFIT:
        return SymbolInfoString(symbol, SYMBOL_CURRENCY_PROFIT);
    case CURRENCY_MARGIN:
        return SymbolInfoString(symbol, SYMBOL_CURRENCY_MARGIN);
    case PATH_IN_TREE:
        return SymbolInfoString(symbol, SYMBOL_PATH);
    }

    return "";
}

int CMarket::InfoInteger(ENUM_SYMBOL info)
{
    if (this._symbol == "")
    {
        ErrorHandler.SetError(SDK_ERROR_UNINITIALIZED_CLASS_MEMBER);
        ErrorHandler.PrintErrorMessage();
        return -1;
    }

    return this.InfoInteger(this._symbol, info);
}

bool CMarket::InfoBoolean(ENUM_SYMBOL info)
{
    if (this._symbol == "")
    {
        ErrorHandler.SetError(SDK_ERROR_UNINITIALIZED_CLASS_MEMBER);
        ErrorHandler.PrintErrorMessage();
        return false;
    }

    return this.InfoBoolean(this._symbol, info);
}

double CMarket::InfoDouble(ENUM_SYMBOL info)
{
    if (this._symbol == "")
    {
        ErrorHandler.SetError(SDK_ERROR_UNINITIALIZED_CLASS_MEMBER);
        ErrorHandler.PrintErrorMessage();
        return -1;
    }

    return this.InfoDouble(this._symbol, info);
}

string CMarket::InfoString(ENUM_SYMBOL info)
{
    if (this._symbol == "")
    {
        ErrorHandler.SetError(SDK_ERROR_UNINITIALIZED_CLASS_MEMBER);
        ErrorHandler.PrintErrorMessage();
        return "";
    }

    return this.InfoString(this._symbol, info);
}

double CMarket::GetHigh(string symbol, ENUM_TIMEFRAMES timeframe, int shift)
{
    if(symbol == "")
    {
        ErrorHandler.SetError(SDK_ERROR_INVALID_PARAMETER);
        ErrorHandler.PrintErrorMessage();
        return -1;
    }

    return iHigh(symbol, timeframe, shift);
}

double CMarket::GetHigh(int shift)
{
    if (this._symbol == "" || this._timeframe == 0)
    {
        ErrorHandler.SetError(SDK_ERROR_UNINITIALIZED_CLASS_MEMBER);
        ErrorHandler.PrintErrorMessage();
        return -1;
    }

    return this.GetHigh(this._symbol, this._timeframe, shift);
}

double CMarket::GetLow(string symbol, ENUM_TIMEFRAMES timeframe, int shift)
{
    if(symbol == "")
    {
        ErrorHandler.SetError(SDK_ERROR_INVALID_PARAMETER);
        ErrorHandler.PrintErrorMessage();
        return -1;
    }

    return iLow(symbol, timeframe, shift);
}

double CMarket::GetLow(int shift)
{
    if (this._symbol == "" || this._timeframe == 0)
    {
        ErrorHandler.SetError(SDK_ERROR_UNINITIALIZED_CLASS_MEMBER);
        ErrorHandler.PrintErrorMessage();
        return -1;
    }

    return this.GetLow(this._symbol, this._timeframe, shift);
}

double CMarket::GetOpen(string symbol, ENUM_TIMEFRAMES timeframe, int shift)
{
    if(symbol == "")
    {
        ErrorHandler.SetError(SDK_ERROR_INVALID_PARAMETER);
        ErrorHandler.PrintErrorMessage();
        return -1;
    }

    return iOpen(symbol, timeframe, shift);
}

double CMarket::GetOpen(int shift)
{
    if (this._symbol == "" || this._timeframe == 0)
    {
        ErrorHandler.SetError(SDK_ERROR_UNINITIALIZED_CLASS_MEMBER);
        ErrorHandler.PrintErrorMessage();
        return -1;
    }

    return this.GetOpen(this._symbol, this._timeframe, shift);
}

double CMarket::GetClose(string symbol, ENUM_TIMEFRAMES timeframe, int shift)
{
    if(symbol == "")
    {
        ErrorHandler.SetError(SDK_ERROR_INVALID_PARAMETER);
        ErrorHandler.PrintErrorMessage();
        return -1;
    }

    return iClose(symbol, timeframe, shift);
}

double CMarket::GetClose(int shift)
{
    if (this._symbol == "" || this._timeframe == 0)
    {
        ErrorHandler.SetError(SDK_ERROR_UNINITIALIZED_CLASS_MEMBER);
        ErrorHandler.PrintErrorMessage();
        return -1;
    }

    return this.GetClose(this._symbol, this._timeframe, shift);
}

int CMarket::GetVolume(string symbol, ENUM_TIMEFRAMES timeframe, int shift)
{
    if(symbol == "")
    {
        ErrorHandler.SetError(SDK_ERROR_INVALID_PARAMETER);
        ErrorHandler.PrintErrorMessage();
        return -1;
    }

    return iVolume(symbol, timeframe, shift);
}

int CMarket::GetVolume(int shift)
{
    if (this._symbol == "" || this._timeframe == 0)
    {
        ErrorHandler.SetError(SDK_ERROR_UNINITIALIZED_CLASS_MEMBER);
        ErrorHandler.PrintErrorMessage();
        return -1;
    }

    return this.GetVolume(this._symbol, this._timeframe, shift);
}

datetime CMarket::GetTime(string symbol, ENUM_TIMEFRAMES timeframe, int shift)
{
    if(symbol == "")
    {
        ErrorHandler.SetError(SDK_ERROR_INVALID_PARAMETER);
        ErrorHandler.PrintErrorMessage();
        return -1;
    }

    return iTime(symbol, timeframe, shift);
}

datetime CMarket::GetTime(int shift)
{
    if (this._symbol == "" || this._timeframe == 0)
    {
        ErrorHandler.SetError(SDK_ERROR_UNINITIALIZED_CLASS_MEMBER);
        ErrorHandler.PrintErrorMessage();
        return -1;
    }

    return this.GetTime(this._symbol, this._timeframe, shift);
}

int CMarket::GetHighest(string symbol, ENUM_TIMEFRAMES timeframe, ENUM_MIX type, int count, int start)
{
    if(symbol == "")
    {
        ErrorHandler.SetError(SDK_ERROR_INVALID_PARAMETER);
        ErrorHandler.PrintErrorMessage();
        return -1;
    }

    switch (type)
    {
    case PASS_HIGH:
        return iHighest(symbol, timeframe, MODE_HIGH, count, start);
        break;
    case PASS_LOW:
        return iHighest(symbol, timeframe, MODE_LOW, count, start);
        break;
    case PASS_OPEN:
        return iHighest(symbol, timeframe, MODE_OPEN, count, start);
        break;
    case PASS_CLOSE:
        return iHighest(symbol, timeframe, MODE_CLOSE, count, start);
        break;
    }

    return -1;
}

int CMarket::GetHighest(ENUM_MIX type, int count, int start)
{
    if (this._symbol == "" || this._timeframe == 0)
    {
        ErrorHandler.SetError(SDK_ERROR_UNINITIALIZED_CLASS_MEMBER);
        ErrorHandler.PrintErrorMessage();
        return -1;
    }

    switch (type)
    {
    case PASS_HIGH:
        return iHighest(this._symbol, this._timeframe, MODE_HIGH, count, start);
        break;
    case PASS_LOW:
        return iHighest(this._symbol, this._timeframe, MODE_LOW, count, start);
        break;
    case PASS_OPEN:
        return iHighest(this._symbol, this._timeframe, MODE_OPEN, count, start);
        break;
    case PASS_CLOSE:
        return iHighest(this._symbol, this._timeframe, MODE_CLOSE, count, start);
        break;
    }

    return -1;
}

int CMarket::GetLowest(string symbol, ENUM_TIMEFRAMES timeframe, ENUM_MIX type, int count, int start)
{
    if(symbol == "")
    {
        ErrorHandler.SetError(SDK_ERROR_INVALID_PARAMETER);
        ErrorHandler.PrintErrorMessage();
        return -1;
    }

    switch (type)
    {
    case PASS_HIGH:
        return iLowest(symbol, timeframe, MODE_HIGH, count, start);
        break;
    case PASS_LOW:
        return iLowest(symbol, timeframe, MODE_LOW, count, start);
        break;
    case PASS_OPEN:
        return iLowest(symbol, timeframe, MODE_OPEN, count, start);
        break;
    case PASS_CLOSE:
        return iLowest(symbol, timeframe, MODE_CLOSE, count, start);
        break;
    }

    return -1;
}

int CMarket::GetLowest(ENUM_MIX type, int count, int start)
{
    if (this._symbol == "" || this._timeframe == 0)
    {
        ErrorHandler.SetError(SDK_ERROR_UNINITIALIZED_CLASS_MEMBER);
        ErrorHandler.PrintErrorMessage();
        return -1;
    }

    switch (type)
    {
    case PASS_HIGH:
        return iLowest(this._symbol, this._timeframe, MODE_HIGH, count, start);
        break;
    case PASS_LOW:
        return iLowest(this._symbol, this._timeframe, MODE_LOW, count, start);
        break;
    case PASS_OPEN:
        return iLowest(this._symbol, this._timeframe, MODE_OPEN, count, start);
        break;
    case PASS_CLOSE:
        return iLowest(this._symbol, this._timeframe, MODE_CLOSE, count, start);
        break;
    }

    return -1;
}