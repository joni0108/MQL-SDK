# CTextFile Class
This is class from the files module of the MQL package. It will allow you to work with CSV files with highly usefull methods.

## Installation
If you didn't imported all the SDK or the MQL module, you can import this module using:
```cpp
#include <SDK-MQL/mql/files.mqh>
```

## Methods
```cpp
   void              Create(string name, string path = NULL, bool commonFlag = false, int rows = -1, int columns = -1);  //Constructor, call it when creating the object.
   bool              Read(string &returned[]);                            //Reads the whole file and return the data into an array.
   string            ReadCell(int row, int col);                          //Reads an specific cell value.
   bool              WriteCell(int row, int col, string toWrite);         //Write data to an specific cell
   bool              FindCell(string toFind, int &resRow, int &resCol);   //Finds a value in a cell and return the first found coordinates to the given variables.
   bool              Rename(string newName);                              //Renames the file
   bool              Move(string newPath, bool deleteFolder = false);     //Moves the file to a new path
   bool              Delete();                                            //Deletes the file

   //--- Getters
   string            GetFileName();      //Return the file name
   string            GetFilePath();      //Return the file path
   string            GetFileExtension(); //Return the file extension
   string            GetFullPath();      //Return the full path
   bool              IsCommon();         //Return if the file is in the common folder or not                    
```

## Example
```cpp
#include <SDK-MQL/mql/files.mqh>    //Including the module

//Creating a class object
CCSVFile myFile;

int OnInit()
{
    //Calling the custom constructor
    myFile.Create("MyLittleFile"); //No needs to include the .csv

    //Writing in the cell "A2" which is in the row 2, column 1
    myFile.WriteCell(2, 1, "Hello world!");

    //Reading the cell
    Print(myFile.ReadCell(2, 1));

    //Deleting the file
    myFile.Delete();

    return INIT_SUCCEEDED;
}
```

Table where the row written is highlighted

|   A   |   B   |   C   |   D   |   E   |   F   |  ...  |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|   1   |   1   |   1   |   1   |   1   |   1   |   1   |
|  `2`  |   2   |   2   |   2   |   2   |   2   |   2   |
|   3   |   3   |   3   |   3   |   3   |   3   |   3   |
|  ...  |  ...  |  ...  |  ...  |  ...  |  ...  |  ...  |


## Errors returned
```cpp
SDK_ERROR_UNINITIALIZED_CLASS_MEMBER - If the Create() method was not called.
SDK_ERROR_FILE_OPENING_FAILED - If the file couln't be opened, it can be so many reasons, so check the MQL error by typing Print(GetLastError())
```