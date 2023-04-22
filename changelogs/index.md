# Changelog
# `MQL-SDK version 1.0.0`
*Released in April 30<sup>th</sup>, 2023*

## Issues Solved in this release
* This is the initial release, not bugs or issues to fix.

## New Enhancements
### MQL Package
We added the MQL package that allows you to code your expert advisors for both languages (MQL4 & MQL5) using only one sintax.
* **We covered the top 5 indicators in the markets** [>](../docs/mql/indicators.md) MA, ATR, SAR, MACD, RSI.
* **We covered all the  trading functions** [>](../docs/mql/trade.md) Now you can send and handle trades for both platforms with the same syntax, and with a structure very similar to the CTrade class of MQL5. It also has some useful methods like lot size calculation.
* **We covered all the account, terminal, and market information** -> You can get all this information using 3 different modules.
* The Symbol information module was avoided due that you can get the same information in MQL4 and MQL5 with the same syntax buil-in using functions like `SymbolInfoDouble()`, etc.

### Network Package
We added the Network package that allows you to work with network related modules.
* **Added the Sockets module** [>](../docs/network/sockets.md) help you working with sockets in a new improved structure than the built-in in MQL5, and now you can also use them in MQL4.

## Notes
* As this is the initial release, check the README file and the docummentation before using the SDK.
* At this moment the manuall installation method is the only available. The automatic installation will be incorporated in further releases.