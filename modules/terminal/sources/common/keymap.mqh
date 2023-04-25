//+------------------------------------------------------------------+
//|                                                   KeyPressed.mqh |
//|                                   Copyright 2023, Just Up Coding |
//|                                            https://www.justup.us |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, Just Up Coding"
#property link      "https://www.justup.us"
#property version   "1.00"

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
class CKeyPressed
  {
public:

   string            GetKey(const int _lparam);
  } GK;

//--- Get key pressed
string CKeyPressed::GetKey(const int _lparam)
  {
   switch(_lparam)
     {
      // alphabet
      case  65:
         return("A");
         break;
      case  66:
         return("B");
         break;
      case  67:
         return("C");
         break;
      case  68:
         return("D");
         break;
      case  69:
         return("E");
         break;
      case  70:
         return("F");
         break;
      case  71:
         return("G");
         break;
      case  72:
         return("H");
         break;
      case  73:
         return("I");
         break;
      case  74:
         return("J");
         break;
      case  75:
         return("K");
         break;
      case  76:
         return("L");
         break;
      case  77:
         return("M");
         break;
      case  78:
         return("N");
         break;
      case  79:
         return("O");
         break;
      case  80:
         return("P");
         break;
      case  81:
         return("Q");
         break;
      case  82:
         return("R");
         break;
      case  83:
         return("S");
         break;
      case  84:
         return("T");
         break;
      case  85:
         return("U");
         break;
      case  86:
         return("V");
         break;
      case  87:
         return("W");
         break;
      case  88:
         return("X");
         break;
      case  89:
         return("Y");
         break;
      case  90:
         return("Z");
         break;

      // number
      case  48:
         return("0");
         break;
      case  49:
         return("1");
         break;
      case  50:
         return("2");
         break;
      case  51:
         return("3");
         break;
      case  52:
         return("4");
         break;
      case  53:
         return("5");
         break;
      case  54:
         return("6");
         break;
      case  55:
         return("7");
         break;
      case  56:
         return("8");
         break;
      case  57:
         return("9");
         break;

      // numeric keypad
      case  96:
         return("T0");
         break;
      case  97:
         return("T1");
         break;
      case  98:
         return("T2");
         break;
      case  99:
         return("T3");
         break;
      case 100:
         return("T4");
         break;
      case 101:
         return("T5");
         break;
      case 102:
         return("T6");
         break;
      case 103:
         return("T7");
         break;
      case 104:
         return("T8");
         break;
      case 105:
         return("T9");
         break;
      case 106:
         return("T*");
         break;
      case 107:
         return("T+");
         break;
      case 109:
         return("T-");
         break;
      case 110:
         return("T.");
         break;
      case 111:
         return("T/");
         break;

      // symbol
      case 186:
         return(":*");
         break;
      case 187:
         return(";+");
         break;
      case 188:
         return(",<");
         break;
      case 189:
         return("-=");
         break;
      case 190:
         return(".>");
         break;
      case 191:
         return("/?");
         break;
      case 192:
         return("@`");
         break;
      case 219:
         return("[{");
         break;
      case 220:
         return("\\|");
         break;
      case 221:
         return("]}");
         break;
      case 222:
         return("^~");
         break;
      case 226:
         return("\\_");
         break;

      // function key
      case 112:
         return("F1");
         break;
      case 113:
         return("F2");
         break;
      case 114:
         return("F3");
         break;
      case 115:
         return("F4");
         break;
      case 116:
         return("F5");
         break;
      case 117:
         return("F6");
         break;
      case 118:
         return("F7");
         break;
      case 119:
         return("F8");
         break;
      case 120:
         return("F9");
         break;
      case 121:
         return("F10");
         break;
      case 122:
         return("F11");
         break;
      case 123:
         return("F12");
         break;

      // control key
      case   8:
         return("BackSpace");
         break;
      case  12:
         return("NumLockOFF T5");
         break;
      case  13:
         return("Enter");
         break;
      case  16:
         return("Shift");
         break;
      case  17:
         return("Ctrl");
         break;
      case  18:
         return("Alt");
         break;
      case  19:
         return("Pause");
         break;
      case  28:
         return("変換");
         break;
      case  29:
         return("無変換");
         break;
      case  32:
         return("Space");
         break;
      case  33:
         return("PageUp");
         break;
      case  34:
         return("PageDown");
         break;
      case  35:
         return("End");
         break;
      case  36:
         return("Home");
         break;
      case  37:
         return("←");
         break;
      case  38:
         return("↑");
         break;
      case  39:
         return("→");
         break;
      case  40:
         return("↓");
         break;
      case  45:
         return("Insert");
         break;
      case  46:
         return("Delete");
         break;
      case  91:
         return("Win");
         break;
      case  93:
         return("Apps");
         break;
      case 144:
         return("NumLock");
         break;
      case 145:
         return("ScrollLock");
         break;
      case 240:
         return("英数");
         break;
      case 242:
         return("カタカナ/ひらがな");
         break;
      case 243:
         return("Esc");
         break;
      case 244:
         return("半角/全角");
         break;
      case   9:
         return("Tab");
         break;

      default:
         break;
     }

   return("");
  }
//+------------------------------------------------------------------+
