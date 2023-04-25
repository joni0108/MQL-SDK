//+------------------------------------------------------------------+
//|                                              OneClickTrading.mqh |
//|                                   Copyright 2023, Just Up Coding |
//|                                            https://www.justup.us |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, Just Up Coding"
#property link      "https://www.justup.us"
#property strict

#include <WinUser32.mqh>

#import "user32.dll"
   int  GetParent(int hWnd);
   int  GetWindowRect(int hWnd, int &rect[4]); 
   int  SendMessageW(int hWnd,int Msg,int wParam,int lParam);
   void keybd_event(int bVk,int bScan,int dwFlags,int dwExtraInfo);
   void mouse_event(int dwFlags,int dx,int dy,int dwData,int dwExtraInfo);
   int GetSystemMetrics(int nIndex);
   int SetFocus(int hWnd);
   int SetActiveWindow(int hWnd);
   int FindWindowW(string lpClassName,string lpWindowName);
#import

#define UP MOUSEEVENTF_LEFTUP
#define DOWN MOUSEEVENTF_LEFTDOWN

struct KeyMap{
   string key;
   int value;
};

KeyMap KeyMaps[11];

class COneClickTradingWindow
  {
public:
                     COneClickTradingWindow(void);
                    ~COneClickTradingWindow(void) {}
                    void ClickBuy();
                    void ClickSell();
                    void SetLots(double val);
private:
   void AssignKeyMaps();
  } OCT;

COneClickTradingWindow::COneClickTradingWindow()
{
   AssignKeyMaps();
}

void COneClickTradingWindow::AssignKeyMaps(){
   KeyMaps[0].key = "0";
   KeyMaps[0].value = 0x30;
   
   KeyMaps[1].key = "1";
   KeyMaps[1].value = 0x31;
   
   KeyMaps[2].key = "2";
   KeyMaps[2].value = 0x32;
   
   KeyMaps[3].key = "3";
   KeyMaps[3].value = 0x33;
   
   KeyMaps[4].key = "4";
   KeyMaps[4].value = 0x34;
   
   KeyMaps[5].key = "5";
   KeyMaps[5].value = 0x35;
   
   KeyMaps[6].key = "6";
   KeyMaps[6].value = 0x36;
   
   KeyMaps[7].key = "7";
   KeyMaps[7].value = 0x37;
   
   KeyMaps[8].key = "8";
   KeyMaps[8].value = 0x38;
   
   KeyMaps[9].key = "9";
   KeyMaps[9].value = 0x39;
   
   KeyMaps[10].key = ".";
   KeyMaps[10].value = 0xBE;
}

void COneClickTradingWindow::ClickBuy(void){
   CheckClickOnceActivated();
   int r[4];
   int handle=(int)ChartGetInteger(0,CHART_WINDOW_HANDLE);
   GetWindowRect(GetParent(GetParent(handle)),r);
   
   int sx = GetSystemMetrics(SM_CXSCREEN);
   int sy = GetSystemMetrics(SM_CYSCREEN);

   int x = (r[0] + 180) * 65536 / sx;
   int y = (r[1] + 30) * 65536 / sy;
   
   SetActiveWindow(handle);
   mouse_event(DOWN | MOUSEEVENTF_ABSOLUTE | MOUSEEVENTF_MOVE, x, y, 0, 0);
   Sleep(100);
   mouse_event(UP | MOUSEEVENTF_ABSOLUTE | MOUSEEVENTF_MOVE, x, y, 0, 0);
}

void COneClickTradingWindow::ClickSell(void){
   CheckClickOnceActivated();
   int r[4];
   int handle=(int)ChartGetInteger(0,CHART_WINDOW_HANDLE);
   GetWindowRect(GetParent(GetParent(handle)),r);
   
   int sx = GetSystemMetrics(SM_CXSCREEN);
   int sy = GetSystemMetrics(SM_CYSCREEN);

   int x = (r[0] + 40) * 65536 / sx;
   int y = (r[1] + 30) * 65536 / sy;
   
   SetActiveWindow(handle);
   mouse_event(DOWN | MOUSEEVENTF_ABSOLUTE | MOUSEEVENTF_MOVE, x, y, 0, 0);
   Sleep(100);
   mouse_event(UP | MOUSEEVENTF_ABSOLUTE | MOUSEEVENTF_MOVE, x, y, 0, 0);
}

void COneClickTradingWindow::SetLots(double val){
   CheckClickOnceActivated();
   int r[4];
   int handle=(int)ChartGetInteger(0,CHART_WINDOW_HANDLE);
   GetWindowRect(GetParent(GetParent(handle)),r);
   
   int sx = GetSystemMetrics(SM_CXSCREEN);
   int sy = GetSystemMetrics(SM_CYSCREEN);

   int x = (r[0] + 115) * 65536 / sx;
   int y = (r[1] + 30) * 65536 / sy;
   
   SetActiveWindow(handle);
   mouse_event(DOWN | MOUSEEVENTF_ABSOLUTE | MOUSEEVENTF_MOVE, x, y, 0, 0);
   Sleep(100);
   mouse_event(UP | MOUSEEVENTF_ABSOLUTE | MOUSEEVENTF_MOVE, x, y, 0, 0);
   Sleep(100);
   
   string valstring = DoubleToString(val,2);
   string volumestringarray[]; StringToStringArray(valstring, volumestringarray);
   for(int i=0;i<ArraySize(volumestringarray);i++)
     {
         int value = FindKeyValue(volumestringarray[i]);
         Press(value);
         Print(valstring + " " + volumestringarray[i] + " " + (string)value);
         Sleep(50);
     }
}

void StringToStringArray(string val, string &array[]){
   int len = StringLen(val);
   for(int i=0;i<len;i++)
     {
         ArrayResize(array, ArraySize(array) + 1);
         array[ArraySize(array)-1] = StringSubstr(val, i,1);
     }
}

int FindKeyValue(string key){
   for(int i=0;i<ArraySize(KeyMaps);i++)
     {
         if(KeyMaps[i].key == key) return KeyMaps[i].value;
     }
   return -1;
}

void Press(int key){
   keybd_event(key,0,0,0);
   keybd_event(key,0,KEYEVENTF_KEYUP,0);
}

bool CheckClickOnceActivated(){
   if(ChartGetInteger(0, CHART_SHOW_ONE_CLICK) == TRUE)return true;
   
   Alert("Click once not activated.");
   return false;
}