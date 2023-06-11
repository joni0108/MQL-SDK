# KeyMap Module
This is a module of the Terminal package that allows to control the terminal interface from code. This function will detect any key pressed by the user in his keyboard and return the key name as a string.

## Installation
If you didn't imported all the SDK or the Network module, you can import this module using:
```cpp
#include <MQL-SDK/modules/terminal/keymap.mqh>
```

# CKeyPressed Class
## Methods
```cpp
string GetKey(const int _lparam) // Status of the AutoTrading button
```

Call it from the `OnChartEvent` function to detect any key pressed by the user.

## Example of Usage
```cpp
//Including the module
#include <MQL-SDK/modules/terminal/keymap.mqh>

void OnChartEvent(const int id,const long& lparam,const double& dparam,const string& sparam)
  {
    //Printing the keyname of the key pressed by the user
    If (GK.GetKey(lparam) == "A")
    {
      Print("Yeah, you pressed the A key!")
    }
    else
    {
      Print("You didn't pressed the A key!");
      Print("You pressed the " +GK.GetKey(lparam) + " key!"
    }
  }
```

## Key Names
You can use the following names to check an entry.

|   Key Names   |
| :-----------: |
|       A       |
|       B       |
|       C       |
|       D       |
|       E       |
|       F       |
|       G       |
|       H       |
|       I       |
|       J       |
|       K       |
|       L       |
|       M       |
|       N       |
|       O       |
|       P       |
|       Q       |
|       R       |
|       S       |
|       T       |
|       U       |
|       V       |
|       W       |
|       X       |
|       Y       |
|       Z       |
|       0       |
|       1       |
|       2       |
|       3       |
|       4       |
|       5       |
|       6       |
|       7       |
|       8       |
|       9       |
|      T0       |
|      T1       |
|      T2       |
|      T3       |
|      T4       |
|      T5       |
|      T6       |
|      T7       |
|      T8       |
|      T9       |
|      T*       |
|      T+       |
|      T-       |
|      T.       |
|      T/       |
|      :*       |
|      ;+       |
|      ,<       |
|      -=       |
|      .>       |
|      /?       |
|      @`       |
|      [{       |
|      \|       |
|      ]}       |
|      ^~       |
|       _       |
|      F1       |
|      F2       |
|      F3       |
|      F4       |
|      F5       |
|      F6       |
|      F7       |
|      F8       |
|      F9       |
|      F10      |
|      F11      |
|      F12      |
|   BackSpace   |
| NumLockOFF T5 |
|     Enter     |
|     Shift     |
|     Ctrl      |
|      Alt      |
|     Pause     |
|     変換      |
|    無変換     |
|     Space     |
|    PageUp     |
|   PageDown    |
|      End      |
|     Home      |
|       ←       |
|       ↑       |
|       →       |
|       ↓       |
|    Insert     |
|    Delete     |
|      Win      |
|     Apps      |
|    NumLock    |
|  ScrollLock   |
|     英数      |
|   カタカナ/   |

## Errors
```
It will return "" if the key pressed is not in the list.
```