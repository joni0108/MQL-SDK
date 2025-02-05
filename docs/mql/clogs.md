# CLogs Class
This is class from the files module of the MQL package. It will allow you to handle logs files with a pre-defined style and format.

## Installation
If you didn't imported all the SDK or the MQL module, you can import this module using:
```cpp
#include <SDK-MQL/mql/files.mqh>
```

## Methods
```cpp
   void              Create(string name, string path = NULL, bool commonFlag = false);       //Class Constructor, call it in the OnInit()
   void              Add(string details, LOG_TYPE type, int errorCode = 0);                  //Add a log to the file
   void              Initialize();                                                           //Add the initialization line
   void              Unitialize();                                                           //Add the uninitialization line
```

## Enums
```cpp
// To be used in the Add() method.
enum LOG_TYPE
{
    LOG = 0,
    DEBUG = 1,
    INFO = 2,
    WARNING = 3,
    ERROR = 4
};
```

## Example
```cpp
#include <SDK-MQL/mql/files.mqh>    //Including the module

//Creating a class object
CLogs myFile;

int OnInit()
{
    //Calling the custom constructor
    myFile.Create("MyLittleFile"); //No needs to include the .log

    //Let's initialize the logs file
    myFile.Initialize();

    //Let's record a couple of events
    myFile.Add("The file was initialized", LOG); //This is a type "LOG" entry
    myFile.Add("Check the file after the execution", INFO); //This is an "INFO" entry type
    myFile.Add("Opening the file while running can cause bugs in some situations", WARNING); //A "WARNING" type entry.

    //Let's unitilize the file
    myFile.Unitialize();

    return INIT_SUCCEEDED;
}
```

The resulting file is the following.

```md
2023.04.24 17:41 | INIT  | The Logs Files has been initialized------------------------------------------------------------
2023.04.24 17:41 | LOG   | Error code = 0 | Description = The file was initialized
2023.04.24 17:41 | INFO  | Error code = 0 | Description = Check the file after the execution
2023.04.24 17:41 | WARN  | Error code = 0 | Description = Opening the file while running can cause bugs in some situations
2023.04.24 17:41 | DEINIT| The Logs Files has been deinitialized----------------------------------------------------------
```

## Errors returned
```cpp
SDK_ERROR_FILE_OPENING_FAILED - If the file couln't be opened, it can be so many reasons, so check the MQL error by typing Print(GetLastError())
```