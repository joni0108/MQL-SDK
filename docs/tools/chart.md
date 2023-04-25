# Charts Module
This is a module of the Tools package. It will allow you to work with charts. It has the following methods and functions:

* `ChartCloseAll()` - Closes all the charts, except the current one if the parameter `closeCurrent` is set to false, or except the charts with comments if the parameter `skipWithComment` is set to `NULL`.
* `CLogo class` - A class to add logos to the charts.
* `Debug function packages` - A set of functions to add and use a debug button on the chart. These function does start with a "_" before the name due that is only meant to be used while debugging your code.

## Installation
If you didn't imported all the SDK or the MQL module, you can import this module using:
```cpp
#include <MQL-SDK/modules/tools/charts.mqh>
```

# Class CLogo
## Methods
```cpp
   bool Create(long chartId, ENUM_CHART_SIDE _side, string imagePath, int subWindow = 0, int xOffset = 20, int yOffset = 20); //Creates a logo on the chart
   void Delete();  //Deletes the logo from the chart
```

## Example
```cpp
#include <MQL-SDK/modules/tools/charts.mqh>    //Including the module

//Creating a logo on the chart
CLogo logo;

input string logoPath = ""; //The path to the logo image

int OnInit()
{
    logo.Create(ChartID(), CHART_SIDE_RIGHT_DOWN, logoPath);

    return INIT_SUCCEEDED;
}

void OnDeinit(const int reason)
{
    logo.Delete();
}
```

## Enumerations
```cpp
enum ENUM_CHART_SIDE
{
    CHART_SIDE_LEFT_UP = 0,
    CHART_SIDE_RIGHT_UP = 1,
    CHART_SIDE_LEFT_DOWN = 2,
    CHART_SIDE_RIGHT_DOWN = 3
};
```

|     |                      |     |     |                       |     |
| --- | :------------------- | --- | --- | --------------------: | --- |
|     | CHART_SIDE_LEFT_UP   |     |     |   CHART_SIDE_RIGHT_UP |     |
|     |                      |     |     |                       |     |
|     |                      |     |     |                       |     |
|     |                      |     |     |                       |     |
|     |                      |     |     |                       |     |
|     |                      |     |     |                       |     |
|     |                      |     |     |                       |     |
|     |                      |     |     |                       |     |
|     | CHART_SIDE_LEFT_DOWN |     |     | CHART_SIDE_RIGHT_DOWN |     |
|     |                      |     |     |                       |     |

## Notes
The images must be in 'bmp' format within the 'MQL4/Images' folder. And they must be compatible with Metaquotes Languages.

# ChartCloseAll() function
## Parameters
```cpp
   bool closeCurrent = false; //Close the current chart too?
    string skipWithComment = NULL; //Pass a comment to skip the charts with this comment
```

## Example
```cpp
#include <MQL-SDK/modules/tools/charts.mqh>    //Including the module

int OnInit()
{
    ChartCloseAll(false, "Skip this chart");

    return INIT_SUCCEEDED;
}
```

# Debug function packages
These are 4 functions to add and use a debug button on the chart. These function does start with a "_" before the name due that is only meant to be used while debugging your code.

## Functions
1. Create the button using `_DebugButtonCreate()`
```cpp
void _DebugButtonCreate(long chartId, int subWindow = 0, color colorBG = clrDarkGray, color colorText = clrWhite); //Use it on the OnInit() function
```

2. Check if the button was pressed using `_IsDebugButtonPressed()`
```cpp
bool _IsDebugButtonPressed(); //Use it on the OnChartEvent() function
```

3. Unpress the button `_DebugButtonOnClick()`
```cpp
void _DebugButtonOnClick(); //Use it on the OnChartEvent() function after the _IsDebugButtonPressed() function
```

4. Delete the button `_DebugButtonDelete()`
```cpp
void _DeleteDebugBut(); //Use it on the OnDeinit() function
```

## Example
```cpp
#include <MQL-SDK/modules/tools/charts.mqh>    //Including the module

int OnInit()
{
    _DebugButtonCreate(ChartID());

    return INIT_SUCCEEDED;
}

void OnChartEvent(const int id, const long &lparam, const double &dparam, const string &sparam)
{
    if(_IsDebugButtonPressed())
    {
        _DebugButtonOnClick();
        Print("Debug button pressed");
    }
}

void OnDeinit(const int reason)
{
    _DebugButtonDelete();
}
```