# TimeInput Module
This is a module of the Tools package. It allows you to take a time from the user using an enumerator and convert it to hours, minutes.

## Installation
If you didn't imported all the SDK or the MQL module, you can import this module using:
```cpp
#include <MQL-SDK/modules/tools/timeinput.mqh>
```

# Functions & Enumerators
## Enumerators
```cpp
//Enumerators
HOURS60 // 0 to 23 hours and 0 minutes precision
HOURS30 // 0 to 23 hours and 30 minutes precision
HOURS15 // 0 to 23 hours and 15 minutes precision
```

## Functions
```cpp
//Modifies the original variables passed as parameters
   bool  MatchHours60(int &hours, int &minutes, HOURS60 time);  //Returns true if the time is valid
   bool  MatchHours30(int &hours, int &minutes, HOURS30 time);  //Returns true if the time is valid
   bool  MatchHours15(int &hours, int &minutes, HOURS15 time);  //Returns true if the time is valid
```

## Example
```cpp
#include <MQL-SDK/modules/tools/timeinput.mqh>    //Including the module

//External variable to user
input HOURS30 time = -1;

//Internal variables
int startHour = -1;
int startMinute = -1;

int OnInit()
{
    if(MatchHours30(startHour, startMinute, time) == false) //If the time is not valid
    {
        Print("Invalid time");
        return INIT_FAILED;
    }

    Print("Time: ", startHour, ":", startMinute);

    return INIT_SUCCEEDED;
}
```


## Errors returned
NONE