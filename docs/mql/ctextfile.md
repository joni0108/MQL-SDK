# CTextFile Class
This is class from the files module of the MQL package. It will allow you to work with basic text files.

## Installation
If you didn't imported all the SDK or the MQL module, you can import this module using:
```cpp
#include <MQL-SDK/modules/mql/files.mqh>
```

## Methods
```cpp
   void Create(string name, string path = NULL, bool commonFlag = false, string extension = ".txt");  //Class Constructor
   bool AddText(string text);                             //Adds a text line to the file
   string Read();                                         //Read the first line of the file
   string ReadLine(int lineNum);                          //Read an specific line of the file, starting by 1
   int CountLines();                                      //Return the amount of lines of the document
   bool DeleteLine(int lineNum);                          //Deletes an specific line, starting by 1
   int GetLinePosition(string textToFind);                //Return the line position of a given string if found, starting by 1
   bool Rename(string newName);                           //Renames the file
   bool Move(string newPath, bool deleteFolder = false);  //Moves the file to a new path
   bool Delete();                                         //Deletes the file
   void ReadToArray(string &resArray[]);                  //This updates the FullFileLines[] array to be used later.

   //--- Getters
   string GetFileExtension();  //Return the file extension
   string GetFilePath();   //Return the file path
   string GetFileName();   //Return the file name
   string GetFullPath();   //Return the full path
   bool IsCommon();        //Return if the file is in the common folder or not                       
```

## Example
```cpp
#include <MQL-SDK/modules/mql/files.mqh>    //Including the module

//Creating a class object
CTextFile myFile;

int OnInit()
{
    //Calling the custom constructor
    myFile.Create("MyLittleFile"); //No needs to include the .txt

    //Let's write 3 lines
    myFile.AddText("Hello world!");
    myFile.AddText("Hello world! 2");
    myFile.AddText("Hello world! 3");

    //Reading the second line
    Print(myFile.ReadLine(2));

    //Deleting the third line and then counting the lines
    myFile.DeleteLine(3);
    Print("Number of lines: " + myFile.CountLines());

    //Deleting the file
    myFile.Delete();

    return INIT_SUCCEEDED;
}
```

The file lines starts at 1 instead of 0 as common in coding.

```md
Line 1, NOT 0
Line 2, NOT 1
Line 3, NOT 2
```

## Errors returned
```cpp
SDK_ERROR_INVALID_PARAMETER - If one of the parameters was invalid, like a negative number for the ReadLine()
SDK_ERROR_FILE_OPENING_FAILED - If the file couln't be opened, it can be so many reasons, so check the MQL error by typing Print(GetLastError())
```