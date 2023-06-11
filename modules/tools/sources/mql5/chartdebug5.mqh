#include <controls/Button.mqh>

CButton debugButton;

void _DebugButtonCreate(long chartId, int subWindow = 0, color colorBG = clrDarkGray, color colorText = clrWhite)
{
   debugButton.Create(chartId,"DebugButton",subWindow,20, 20, 200, 70);
   debugButton.ColorBackground(colorBG);
   debugButton.Color(colorText);
   debugButton.Text("DEBUG BUTTON");
   debugButton.FontSize(12);
}

void _DebugButtonOnClick()
{
    Sleep(500);
    
    if(debugButton.Pressed() == true)
      debugButton.Pressed(false);
}

void _DeleteDebugBut()
{
   debugButton.Destroy();
}

bool _IsDebugButtonPressed()
{
   return debugButton.Pressed();
}