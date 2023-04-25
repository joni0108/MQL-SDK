#include "../../../internal/errorsHandler.mqh"

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CTextFile
  {
public:

   //--- Constructor
                     CTextFile() {}
   void              Create(string name, string path = NULL, bool commonFlag = false, string extension = ".txt");             //Class Constructor
   bool              AddText(string text);                                                                                    //Adds a text line to the file
   string            Read();                                                                                                  //Read the first line of the file
   string            ReadLine(int lineNum);                                                                                   //Read an specific line of the file
   int               CountLines();                                                                                            //Return the amount of lines of the document
   bool              DeleteLine(int lineNum);                                                                                 //Deletes an specific line
   int               GetLinePosition(string textToFind);                                                                      //Return the line posicion of a given string if found
   bool              Rename(string newName);                                                                                  //Renames the file
   bool              Move(string newPath, bool deleteFolder = false);                                                         //Moves the file to a new path
   bool              Delete();                                                                                                //Deletes the file
   void              ReadToArray(string &resArray[]);                                                                         //This updates the FullFileLines[] array to be used later.

   //--- Getters
   string            GetFileName() { return m_fileName; }                                    //Return the file name
   string            GetFilePath() { return m_filePath; }                                    //Return the file path
   string            GetFileExtension() { return m_fileExtension; }                          //Return the file extension
   string            GetFullPath() { return m_filePath + m_fileName + m_fileExtension; }     //Return the full path
   bool              IsCommon() { return m_inCommonFolder; }                                 //Return if the file is in the common folder or not                                                     //Is an array with all the document lines. ReadFull() must be called before to update the lines.

private:
   string            m_fileName;
   string            m_filePath;
   string            m_fileExtension;
   bool              m_inCommonFolder;
   int               m_hFile;
  };

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CTextFile::Create(string name,string path=NULL,bool commonFlag=false,string extension = ".txt")
  {
   m_hFile = INVALID_HANDLE;
   m_fileName = name;
   m_filePath = path;
   m_inCommonFolder = commonFlag;
   m_fileExtension = extension;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CTextFile::ReadToArray(string &resArray[])
  {
   int amount = this.CountLines();

   for(int i=0; i<amount; i++)
     {
      resArray[i] = ReadLine(i + 1);
     }
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CTextFile::AddText(string text)
  {
   int fileHandle = INVALID_HANDLE;
   string fullPath = m_filePath + m_fileName + m_fileExtension;

   if(m_inCommonFolder)
     {
      fileHandle = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT | FILE_COMMON);
     }
   else
     {
      fileHandle = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT);
     }
   
   if(fileHandle == INVALID_HANDLE)
     {
      ErrorHandler.SetError(SDK_ERROR_INVALID_PARAMETER);
      return false;
     }

   FileSeek(fileHandle, 0, SEEK_END);
   if(!FileWrite(fileHandle, text))
     {
      FileClose(fileHandle);
      return false;
     }

   FileClose(fileHandle);

   return true;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string CTextFile::Read()
  {
   int fileHandle = INVALID_HANDLE;
   string fullPath = m_filePath + m_fileName + m_fileExtension;
   string text = "";

   if(m_inCommonFolder)
     {
      fileHandle = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT | FILE_COMMON);
     }
   else
     {
      fileHandle = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT);
     }
   
   if(fileHandle == INVALID_HANDLE)
     {
      ErrorHandler.SetError(SDK_ERROR_FILE_OPENING_FAILED);
      return "-1";
     }

   text = FileReadString(fileHandle);

   FileClose(fileHandle);

   return text;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string CTextFile::ReadLine(int lineNum)
  {
   int fileHandle = INVALID_HANDLE;
   string fullPath = m_filePath + m_fileName + m_fileExtension;
   string text = "";

   if(lineNum < 1 || lineNum > CountLines() + 1)
     {
        ErrorHandler.SetError(SDK_ERROR_INVALID_PARAMETER);
        return text;
     }

   if(m_inCommonFolder)
     {
      fileHandle = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT | FILE_COMMON);
     }
   else
     {
      fileHandle = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT);
     }

    if(fileHandle == INVALID_HANDLE)
     {
      ErrorHandler.SetError(SDK_ERROR_FILE_OPENING_FAILED);
      return "-1";
     }

   for(int i = 0; i < lineNum; i++)
     {
      text = FileReadString(fileHandle);
     }


   FileClose(fileHandle);

   return text;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int CTextFile::CountLines()
  {
   int fileHandle = INVALID_HANDLE;
   string fullPath = m_filePath + m_fileName + m_fileExtension;
   int lineCount = 0;

   if(m_inCommonFolder)
     {
      fileHandle = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT | FILE_COMMON);
     }
   else
     {
      fileHandle = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT);
     }
    
    if(fileHandle == INVALID_HANDLE)
     {
      ErrorHandler.SetError(SDK_ERROR_FILE_OPENING_FAILED);
      return false;
     }

   while(!FileIsEnding(fileHandle))
     {
      FileReadString(fileHandle);
      lineCount++;
     }

   FileClose(fileHandle);

   return lineCount;
  }



//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CTextFile::DeleteLine(int lineNum)
  {
   string fullPath = m_filePath + m_fileName + m_fileExtension;
   int controller = 1;
   CTextFile tempFile;

    if(lineNum < 1 || lineNum > CountLines() + 1)
     {
        ErrorHandler.SetError(SDK_ERROR_INVALID_PARAMETER);
        return false;
     }

   tempFile.Create(m_fileName + "_temp", m_filePath, m_inCommonFolder);

   while(controller <= CountLines())
     {
      if(controller != lineNum)
        {
         if(!tempFile.AddText(ReadLine(controller)))
           {
            return false;
           }
        }
      controller++;
     }

   Delete();

   tempFile.Rename(m_fileName);

   Sleep(1000);

   return true;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int CTextFile::GetLinePosition(string textToFind)
  {
   string fullPath = m_filePath + m_fileName + m_fileExtension;
   int lineCount = 1;
   int controller = 1;

   while(controller <= CountLines())
     {
      if(ReadLine(controller) == textToFind)
        {
         return lineCount;
        }
      lineCount++;
      controller++;
     }

   return -1;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CTextFile::Rename(string newName)
  {
   int fileHandle = INVALID_HANDLE;
   string fullPath = m_filePath + m_fileName + m_fileExtension;
   string newFullPath = m_filePath + newName + m_fileExtension;

   if(m_inCommonFolder)
     {
      fileHandle = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT | FILE_COMMON);
      if(fileHandle == INVALID_HANDLE)
        {
         return false;
        }
     }
   else
     {
      fileHandle = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT);
      if(fileHandle == INVALID_HANDLE)
        {
         return false;
        }
     }

   FileClose(fileHandle);
   FileMove(fullPath,m_inCommonFolder,newFullPath,0);
   m_fileName = newName;

   return true;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CTextFile::Move(string newPath, bool deleteFolder = false)
  {
   int fileHandle = INVALID_HANDLE;
   string fullPath = m_filePath + m_fileName + m_fileExtension;
   string newFullPath = newPath + m_fileName + m_fileExtension;

   if(m_inCommonFolder)
     {
      fileHandle = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT | FILE_COMMON);
      if(fileHandle == INVALID_HANDLE)
        {
         ErrorHandler.SetError(SDK_ERROR_FILE_OPENING_FAILED);
         return false;
        }
     }
   else
     {
      fileHandle = FileOpen(fullPath, FILE_WRITE | FILE_READ | FILE_TXT);
      if(fileHandle == INVALID_HANDLE)
        {
         ErrorHandler.SetError(SDK_ERROR_FILE_OPENING_FAILED);
         return false;
        }
     }

   FileClose(fileHandle);
   FileMove(fullPath,m_inCommonFolder,newFullPath,0);

   Sleep(1000);

   if(deleteFolder)
     {
      FolderDelete(m_filePath);
     }

   m_filePath = newPath;

   return true;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CTextFile::Delete()
  {
   string fullPath = m_filePath + m_fileName + m_fileExtension;

   if(m_inCommonFolder)
     {
      if(!FileDelete(fullPath, FILE_COMMON))
        {
         return false;
        }
     }
   else
     {
      if(!FileDelete(fullPath))
        {
         return false;
        }
     }

   return true;
  }
//+------------------------------------------------------------------+
