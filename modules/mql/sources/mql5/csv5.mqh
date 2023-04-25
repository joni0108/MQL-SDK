//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CCSVFile
  {
public:
   void              Create(string name, string path = NULL, bool commonFlag = false, int rows = -1, int columns = -1);  //Constructor, call it when creating the object.
   bool              Read(string &returned[]);                                                                                //Reads the whole file and return the data into an array.
   string            ReadCell(int row, int col);                                                                              //Reads an specific cell value.
   bool              WriteCell(int row, int col, string toWrite);                                                             //Write data to an specific cell
   bool              FindCell(string toFind, int &resRow, int &resCol);                                                       //Finds a value in a cell and return the first found coordinates to the given variables.
   bool              Rename(string newName);                                                                                  //Renames the file
   bool              Move(string newPath, bool deleteFolder = false);                                                         //Moves the file to a new path
   bool              Delete();                                                                                                //Deletes the file

   //--- Getters
   string            GetFileName() { return m_fileName; }                                    //Return the file name
   string            GetFilePath() { return m_filePath; }                                    //Return the file path
   string            GetFileExtension() { return m_fileExtension; }                          //Return the file extension
   string            GetFullPath() { return m_filePath + m_fileName + m_fileExtension; }     //Return the full path
   bool              IsCommon() { return m_inCommonFolder; }                                 //Return if the file is in the common folder or not

private:
   string            m_fileName;
   string            m_filePath;
   string            m_fileExtension;
   bool              m_inCommonFolder;
   int               m_hFile;
   int               m_columns;
   int               m_rows;
  };
//+------------------------------------------------------------------+
void CCSVFile::Create(string name,string path=NULL,bool commonFlag=false, int rows = -1, int columns = -1)
  {
   m_fileName = name;
   m_filePath = path;
   m_fileExtension = ".csv";
   m_inCommonFolder = commonFlag;
   m_columns = columns;
   m_rows = rows;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CCSVFile::Read(string &returned[])
  {
   int handle;

   if(m_inCommonFolder)
      handle = FileOpen(m_filePath + m_fileName + m_fileExtension,FILE_READ|FILE_ANSI|FILE_CSV|FILE_COMMON,";");
   else
      handle = FileOpen(m_filePath + m_fileName + m_fileExtension,FILE_READ|FILE_ANSI|FILE_CSV,";");

   if(handle == INVALID_HANDLE)
    {
      ErrorHandler.SetError(SDK_ERROR_FILE_OPENING_FAILED);
      return false;
    }

   int i = 0;

   while(!FileIsEnding(handle))
     {
      returned[i] = FileReadString(handle);
     }

   FileClose(handle);
   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string CCSVFile::ReadCell(int row,int col)
  {
   if(m_columns < 1 || m_rows < 1)
   {
      ErrorHandler.SetError(SDK_ERROR_UNINITIALIZED_CLASS_MEMBER);
      return "-1";
   }

   int handle;
   string str = "";

   if(m_inCommonFolder)
      handle = FileOpen(m_filePath + m_fileName + m_fileExtension,FILE_READ|FILE_ANSI|FILE_CSV|FILE_COMMON,";");
   else
      handle = FileOpen(m_filePath + m_fileName + m_fileExtension,FILE_READ|FILE_ANSI|FILE_CSV,";");

   if(handle == INVALID_HANDLE)
    {
      ErrorHandler.SetError(SDK_ERROR_FILE_OPENING_FAILED);
      return "-1";
    }

   int currCol = 1;
   int currRow = 1;

   while(!FileIsEnding(handle))
     {
      if(currCol == col && currRow == row)
        {
         //We are in the row
         str = FileReadString(handle);
         break;
        }
      else
         FileReadString(handle);

      if(currCol >= m_columns) //Final de las columnas
        {
         currCol = 1;
         currRow++;
        }
      else
        {
         currCol++;
        }
     }

   FileClose(handle);
   return str;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CCSVFile::WriteCell(int row,int col, string toWrite)
  {
   if(m_columns < 1 || m_rows < 1)
   {
      ErrorHandler.SetError(SDK_ERROR_UNINITIALIZED_CLASS_MEMBER);
      return false;
   }

   int handle;
   string str = "";

   if(m_inCommonFolder)
      handle = FileOpen(m_filePath + m_fileName + m_fileExtension,FILE_READ|FILE_WRITE|FILE_ANSI|FILE_CSV|FILE_COMMON,";");
   else
      handle = FileOpen(m_filePath + m_fileName + m_fileExtension,FILE_READ|FILE_WRITE|FILE_ANSI|FILE_CSV,";");

   if(handle == INVALID_HANDLE)
    {
      ErrorHandler.SetError(SDK_ERROR_FILE_OPENING_FAILED);
      return false;
    }

   int currCol = 1;
   int currRow = 1;
   FileSeek(handle, 0, SEEK_SET);

   while(!FileIsEnding(handle))
     {
      if(currCol == col && currRow == row)
        {
         //We are in the row
         FileWrite(handle,toWrite);
         break;
        }
      else
         FileReadString(handle);

      if(currCol >= m_columns) //Final de las columnas
        {
         currCol = 1;
         currRow++;
        }
      else
        {
         currCol++;
        }
     }

   FileClose(handle);
   return true;
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CCSVFile::Rename(string newName)
  {
   string fullPath = m_filePath + m_fileName + m_fileExtension;
   string newFullPath = m_filePath + newName + m_fileExtension;

   FileMove(fullPath,m_inCommonFolder,newFullPath,0);
   m_fileName = newName;

   return true;
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CCSVFile::Move(string newPath, bool deleteFolder = false)
  {
   string fullPath = m_filePath + m_fileName + m_fileExtension;
   string newFullPath = newPath + m_fileName + m_fileExtension;

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
bool CCSVFile::Delete()
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
//|                                                                  |
//+------------------------------------------------------------------+
bool CCSVFile::FindCell(string toFind,int &resRow, int &resCol)
  {
   if(m_columns < 1 || m_rows < 1)
   {
      ErrorHandler.SetError(SDK_ERROR_UNINITIALIZED_CLASS_MEMBER);
      return false;
   }

   int handle;

   if(m_inCommonFolder)
      handle = FileOpen(m_filePath + m_fileName + m_fileExtension,FILE_READ|FILE_ANSI|FILE_CSV|FILE_COMMON,";");
   else
      handle = FileOpen(m_filePath + m_fileName + m_fileExtension,FILE_READ|FILE_ANSI|FILE_CSV,";");

   if(handle == INVALID_HANDLE)
    {
      ErrorHandler.SetError(SDK_ERROR_FILE_OPENING_FAILED);
      return false;
    }

   int currCol = 1;
   int currRow = 1;
   int pos = 0;

   while(!FileIsEnding(handle))
     {
      if(FileReadString(handle) == toFind)
        {
         resRow = currRow;
         resCol = currCol;
         FileClose(handle);
         return true;
        }

      if(currCol >= m_columns) //Final de las columnas
        {
         currCol = 1;
         currRow++;
        }
      else
        {
         currCol++;
        }
     }

   FileClose(handle);
   return true;
  }