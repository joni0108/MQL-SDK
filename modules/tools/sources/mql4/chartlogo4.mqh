//+------------------------------------------------------------------+
//|                                                    Logo.mqh      |
//|                          Copyright 2022-2025, Just Up Coding LLC |
//|                                             http://www.justup.us |
//+------------------------------------------------------------------+
#include <controls/BmpButton.mqh>
//+------------------------------------------------------------------+
//| Class CLogo                                                      |
//| Usage: displays a bmp logo in one of                             |
//|             the chart corners                                    |
//+------------------------------------------------------------------+

enum ENUM_CHART_SIDE
{
    CHART_SIDE_LEFT_UP = 0,
    CHART_SIDE_RIGHT_UP = 1,
    CHART_SIDE_LEFT_DOWN = 2,
    CHART_SIDE_RIGHT_DOWN = 3
};

class CLogo
{
public:

    bool Create(long chartId, ENUM_CHART_SIDE _side, string imagePath, int subWindow = 0, int xOffset = 20, int yOffset = 20);
    void Delete();

private:
    //--- Logo
    CBmpButton _logo;
    string _name;
    long _chartId;
    int _subWindow;
};

//--- Create logo
bool CLogo::Create(long chartId, ENUM_CHART_SIDE _side, string imagePath, int subWindow = 0, int xOffset = 20, int yOffset = 20)
{
    if(_side > 3 || _side < 0)
    {
        Print("ERR_INVALID_PARAMETER: side must be between 0 and 3");
        return false;
    }
    
    int chWidth = (int)ChartGetInteger(ChartID(),CHART_WIDTH_IN_PIXELS,0);
    int chHeigh = (int)ChartGetInteger(ChartID(),CHART_HEIGHT_IN_PIXELS,0);
    _chartId = chartId;
    _subWindow = subWindow;
    int x1 = 0;
    int y1 = 0;
    
    int nameAdd = 0;
        _name = "logo_" + (string)nameAdd;

        while(ObjectFind(_name) != -1)
        {
            _name = "logo_" + (string)nameAdd;
            nameAdd++;
        }
        
    switch(_side)
    {
        case CHART_SIDE_LEFT_UP:
            x1 = xOffset;
            y1 = yOffset;
            break;
        case CHART_SIDE_RIGHT_UP:
            x1 = chWidth - (150 + xOffset);
            y1 = yOffset;
            break;
        case CHART_SIDE_LEFT_DOWN:
            x1 = xOffset;
            y1 = chHeigh - (150 + yOffset);
            break;
        case CHART_SIDE_RIGHT_DOWN:
            x1 = chWidth - (150 + xOffset);
            y1 = chHeigh - (150 + yOffset);
            break;
    }
    
    //--- Create logo
    if(!_logo.Create(_chartId, _name, _subWindow, x1, y1, 0, 0))
    {
        Print("Error creating logo: " + (string)GetLastError());
        return false;
    }

    if(!_logo.BmpActiveName(imagePath))
    {
        Print("Error setting image");
        return false;
    }

    if(!_logo.BmpOffName(imagePath))
    {
        Print("Error setting image");
        return false;
    }

    if(!_logo.BmpOnName(imagePath))
    {
        Print("Error setting image");
        return false;
    }

    return true;
}

//--- Delete logo
void CLogo::Delete()
{
    _logo.Destroy();
}