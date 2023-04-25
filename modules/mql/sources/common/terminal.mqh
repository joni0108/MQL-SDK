#include "enumerations.mqh"
#include "../../../internal/errorsHandler.mqh"

class CTerminal
{
private:

public:
    CTerminal() { }

    // Getters
    bool InfoBoolean(ENUM_TERMINAL _info);
    int InfoInteger(ENUM_TERMINAL _info);
    string InfoString(ENUM_TERMINAL _info);
} Terminal;

bool CTerminal::InfoBoolean(ENUM_TERMINAL _info)
{
    if (_info < 1 || _info > 7)
    {
        ErrorHandler.SetError(SDK_ERROR_ENUM_OUT_OF_RANGE);
        ErrorHandler.PrintErrorMessage();
        return false;
    }

    switch (_info)
    {
    case CONNECTED:
        return (bool)TerminalInfoInteger(TERMINAL_CONNECTED);
    case DLLS_ALLOWED:
        return (bool)TerminalInfoInteger(TERMINAL_DLLS_ALLOWED);
    case TRADE_ALLOWED_TERMINAL:
        return (bool)TerminalInfoInteger(TERMINAL_TRADE_ALLOWED);
    case EMAIL_ENABLED:
        return (bool)TerminalInfoInteger(TERMINAL_EMAIL_ENABLED);
    case FTP_ENABLED:
        return (bool)TerminalInfoInteger(TERMINAL_FTP_ENABLED);
    case NOTIFICATIONS_ENABLED:
        return (bool)TerminalInfoInteger(TERMINAL_NOTIFICATIONS_ENABLED);
    case MQID_SETTED:
        return (bool)TerminalInfoInteger(TERMINAL_MQID);
    }
    
    return false;
}

int CTerminal::InfoInteger(ENUM_TERMINAL _info)
{
    if (_info != 0)
    {
        ErrorHandler.SetError(SDK_ERROR_ENUM_OUT_OF_RANGE);
        ErrorHandler.PrintErrorMessage();
        return false;
    }

    switch (_info)
    {
    case BUILD:
        return TerminalInfoInteger(TERMINAL_BUILD);
    }

    return false;
}

string CTerminal::InfoString(ENUM_TERMINAL _info)
{
    if (_info < 8 || _info > 12)
    {
        ErrorHandler.SetError(SDK_ERROR_ENUM_OUT_OF_RANGE);
        ErrorHandler.PrintErrorMessage();
        return "";
    }

    switch (_info)
    {
    case LANGUAGE:
        return TerminalInfoString(TERMINAL_LANGUAGE);
    case NAME_TERMINAL:
        return TerminalInfoString(TERMINAL_NAME);
    case PATH:
        return TerminalInfoString(TERMINAL_PATH);
    case DATA_PATH:
        return TerminalInfoString(TERMINAL_DATA_PATH);
    case COMMON_DATA_PATH:
        return TerminalInfoString(TERMINAL_COMMONDATA_PATH);
    }

    return "";
}