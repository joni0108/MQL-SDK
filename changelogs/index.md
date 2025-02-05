# Changelog
# `MQL-SDK version 1.3.1`
*Released in February 4<sup>th</sup>, 2025*

## **Issues Solved in this release**
- **Fixed Errors presented on current Metatrader 5 version** - The file `WinUser32.mqh` were moved to `WinAPI/winuser.mqh`, and the constants were redefined.
- **Removed automatic installator** - As the anti-virus was giving false-positive on it, now it got move to its own branch.
- **Fixed documentation** - Some import routes were wrong on the documentation, now they were fixed.

## **New Enhancements**
* No enhancements on this version

## Notes
* This SDK will be closed, so this is the last update (except for bugfix updates) that I do to this project, instead, I will be focused on MQL5 & CTrader, making a new repository and extend the features I had in stand by, and add new features. However, if there's any bug, please, open an issue and I'll fix it asap.

# `MQL-SDK version 1.3.0`
*Released in June 11<sup>th</sup>, 2023*

## **Issues Solved in this release**
* No bugs found or reported. <br><br>

## **New Enhancements**
### **Terminal Package Extended**
* **Automatic Install** - Added the automatic SDK Libraries installer and its source code. Use it by clicking on the `setup.exe` file in the root folder of the SDK.

## Notes
* If you find any bug while using the automatic installation, please let me know.


# `MQL-SDK version 1.2.0`
*Released in April 27<sup>th</sup>, 2023*

## **Issues Solved in this release**
* No bugs found or reported. <br><br>

## **New Enhancements**
### **Terminal Package Extended**
We have extended the Terminal package with a new module that helps you to detect what key was pressed in the terminal. This module is very useful to create hotkeys.


### **Tools Package Extended**
We have extended the Tools package with a new module (Charts) that add some useful functions and classes to work with charts.

* **CLogo class** - This class allows you to add a logo to the chart very easily.
* **ChartCloseAll() function** - This function allows you to close charts with some filters.
* **Debug functions** - This functions allows you to add a debug button to the chart to debug your code events very easily.

### **API Package Added**
We added a package to communicate with some APIs. At this moment it only contains 3 modules.

* **Discord module** - This module allows you to send embbeded messages to a Discord channel.
* **Telegram module** - This module allows you to send messages to a Telegram channel.
* **Sheets module** - This module allows you to send data to a Google Sheet.

## Notes
* At this moment the manual installation method is still the only available. The automatic installation will be incorporated in further releases.

# `MQL-SDK version 1.1.0`
*Released in April 25<sup>th</sup>, 2023*

## **Issues Solved in this release**
* We found a bug where the links in the ReadMe files only were working in local. They were fixed for this new version. <br><br>

## **New Enhancements**
### **MQL Package Extended**
We have extended the MQL package with a new module that contains 3 classes to handle files. Currently supports CSV, TXT, and LOGS files.

* **CTextFile** - Handle TXT files. Adding more than 10 useful method to work with them, including write, change, and read data from a specific line.
* **CCsvFile** - Handle CSV files, allowing write and read data from a specific cell in a spreadsheet by giving the column and row coordinates.
* **CLogFile** - Handle LOG files. Adding logs with a single line of code and leaving a highly ordenated logs file with a pre-defined structure and format.
* 
### **Tools Package Added**
We added the tools package which will contain useful uncategorized tools to help you with your coding. At this moment it only contains a module.

* **Added the TradingMath module** - This module have over 10 class methods to do some trading and statictics calculation from an array that contains the result of your trades.

### **Terminal Package Added**
We added a package to control your Metatrader terminal from code. At this moment it only contains 3 modules.

* **Added the NewOrder module** - This module allows you to send manual orders from code using the `New Order` window.
* **Added the OneClick module** - This module allows you to send manual orders from code using the `One Click Trading` window.
* **Added the AutoTrading module** - This module allows you to toggle the `AutoTrading` button from code.

## Notes
* At this moment the manual installation method is still the only available. The automatic installation will be incorporated in further releases.

# `MQL-SDK version 1.0.0`
*Released in April 23<sup>th</sup>, 2023*

## **Issues Solved in this release**
* This is the initial release, not bugs or issues to fix.

## **New Enhancements**
### **MQL Package**
We added the MQL package that allows you to code your expert advisors for both languages (MQL4 & MQL5) using only one sintax.
* **We covered the top 5 indicators in the markets** [>](../docs/mql/indicators.md) MA, ATR, SAR, MACD, RSI.
* **We covered all the  trading functions** [>](../docs/mql/trade.md) Now you can send and handle trades for both platforms with the same syntax, and with a structure very similar to the CTrade class of MQL5. It also has some useful methods like lot size calculation.
* **We covered all the account, terminal, and market information** -> You can get all this information using 3 different modules.
* The Symbol information module was avoided due that you can get the same information in MQL4 and MQL5 with the same syntax buil-in using functions like `SymbolInfoDouble()`, etc.

### **Network Package**
We added the Network package that allows you to work with network related modules.
* **Added the Sockets module** [>](../docs/network/sockets.md) help you working with sockets in a new improved structure than the built-in in MQL5, and now you can also use them in MQL4.

## Notes
* As this is the initial release, check the README file and the docummentation before using the SDK.
* At this moment the manuall installation method is the only available. The automatic installation will be incorporated in further releases.