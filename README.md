# MQL-SDK
![](https://img.shields.io/github/license/trollpro0108-code/MQL-SDK)
![](https://img.shields.io/github/v/release/trollpro0108-code/MQL-SDK?include_prereleases&label=last%20release)
![](https://img.shields.io/github/repo-size/trollpro0108-code/MQL-SDK)
![](https://img.shields.io/badge/Languages-MQL4%20%26%20MQL5-purple)
![](https://img.shields.io/github/issues-raw/trollpro0108-code/MQL-SDK)

**What is MQL-SDK?**
This is an open-source framework created with the goal of make a whole complete development kit for your Metatrader projects.

## What is Metaquotes Language (MQL)
MQL is the programming language used by the trading platforms Metatrader 4 and Metatrader 5. It does share syntax with C++ and C#, so knowing any of these languages will make you know MQL as well. <br>
MQL is a close environment, this means that the platforms are allowed to access files just within the data folder of themself, however, you can use other more complex features by including DLL files in your project. <br>
With this language you will be able to code trading robots, trading indicators, and other tools that help traders to diversify and take decisions. <br>
The compiled version of the MQL language are files `ex4` and `ex5` depending on the version used.

## Why do I need this SDK?
MQL got splitted into 2 versions, MQL4 and MQL5, both are highly incompatible in syntax, so, doing your project in the built-in language will make you re-write most of the code to be able to have it in MQL4 and MQL5. However, using this SDK will make you have a 100% compatibility on both languages, so you will **write less** and **support more** <br>
In this SDK is also included some useful libraries and framework that will make your coding work more easy.

## Docummentation
You will have the official MQL documentation in the following link for [MQL4](https://docs.mql4.com/) and [MQL5](https://www.mql5.com/en/docs). <br>
However, while using our SDK we changed most of the functions and methods to be able to use them cross-platform, so reach our docummentation in order to understand how to se them. <br>
In the **Modules** section of this ReadMe files you can reach the docummentation for each module by clicking their hyperlink.

## Getting Started
### Installing the SDK
You can install it manually or using our installation app. See below the instructions for both ways: <br>

**AUTOMATIC**: (already implemented) <br>
1. Download or clone the SDK repository in your computer.
2. Go to the file `setup.exe` and double click it.
3. Follow the instructions in-app to select what to install and what to not.
4. Click on the "Find Path" button and navigate to your MetaEditor data folder.
5. Once inside the MQL4 or MQL5 subfolder, click save.
6. Once all the paths are set, click on the "Install" button.
7. The app will copy all the libraries and required dlls to their folders for the platforms selected.
8. Create a new expert advisor project in your MetaEditor or use one of your already created projects.
9. In the header of your file, before any other non-comment line, copy and paste the line below:

```cpp
#include <MQL-SDK/modules/all.mql>
```

Notes: <br>
You can also include specific modules instead of the whole framework, for doing so, go to the module documentation to see the including rules.

**MANUALLY**: <br>
1. Download or clone the SDK repository in your computer.
2. If you have a Metatrader app already installed in your system, skip to the step **4**.
3. Install the Metatrader 4 or 5 (or both) provided in the `softwares/metatraders` folder, or use your own.
4. Go to the Metatrader data folder; if you used the own provided, the path are below in [default paths](#default-paths).
5. Copy and paste the `MQL-SDK` folder that is inside the `includes` folder into your `includes` folder in the metatrader data folder you navigated to.
6. Copy and paste the files from the `libraries` folder of the SDK repository into the `libraries` folder of your metatrader data folder.
7. Copy and paste the files from the `images` folder of the SDK repository into the `images` folder of your metatrader data folder.
8. Create a new project and include the SDK into your app using:

```cpp
#include <MQL-SDK/modules/all.mql>
```

Notes: <br>
You can also include specific modules instead of the whole framework, for doing so, go to the module documentation to see the including rules.

Do not forget to check the docummentation of each library by clicking on the module name in the table below.

## Docummentation
Access the documentation files in MD format by clicking in the `blue` link of each module name of the table below to check its docummentation.

# Packages & Modules
The SDK will be divided in a package-modules-classes structure. Where,
* A `package` will be like a whole framework. A set of modules and classes for an specific task.
* A `module` can contain 1 or more classes for different sub-tasks.

## Understanding the table
The table below has all the `packages` and `modules`, and their current status/version.

To import them individually you can use:
```cpp
#include <MQL-SDK/<Import as column value>
```

Remember the hierarchy, which means that if you included the whole `mql` package, you do not need to include individually any of its modules. And if you only included one module, example `account` from `mql`, you must included other modules in order to use them.


| Package    |                                               Module                                               | Import as                            | Description                                                                                    | Last Release      |
| :--------- | :------------------------------------------------------------------------------------------------: | :----------------------------------- | :--------------------------------------------------------------------------------------------- | :---------------- |
| `MQL`      |                                                                                                    | `modules/mql.mqh`                    | Allows you to code any EA in a single language and export it to both languages (MQL4 & MQL5).  |                   |
| ->         |       [Account](https://github.com/trollpro0108-code/MQL-SDK/tree/main/docs/mql/account.md)        | modules/mql/account.mqh              | Handle all the account-related information.                                                    | 1.0               |
| ->         |      [Terminal](https://github.com/trollpro0108-code/MQL-SDK/tree/main/docs/mql/terminal.md)       | modules/mql/terminal.mqh             | Handle all the terminal-related information.                                                   | 1.0               |
| ->         |        [Market](https://github.com/trollpro0108-code/MQL-SDK/tree/main/docs/mql/market.md)         | modules/mql/market.mqh               | Handle all the market-related information                                                      | 1.0               |
| ->         |         [Trade](https://github.com/trollpro0108-code/MQL-SDK/tree/main/docs/mql/trade.md)          | modules/mql/trade.mqh                | Send, Manage, and handle orders and positions                                                  | 1.0               |
| ->         |    [Indicators](https://github.com/trollpro0108-code/MQL-SDK/tree/main/docs/mql/indicators.md)     | modules/mql/insdicators.mqh          | Handle the indicators                                                                          | 1.0               |
| ->         |         [Files](https://github.com/trollpro0108-code/MQL-SDK/tree/main/docs/mql/files.md)          | modules/mql/files.mqh                | Handle different files types, including .sets, .logs and .dat                                  | 1.0               |
| `Network`  |                                                                                                    | `modules/network.mqh`                | Allows you to make network-related operations like web-requests, working with sockets, etc     |                   |
| ->         |     [Sockets](https://github.com/trollpro0108-code/MQL-SDK/tree/main/docs/network/sockets.md)      | modules/network/sockets.mqh          | Handle server and client sockets                                                               | 1.0               |
| `Terminal` |                                                                                                    | `modules/terminal.mqh`               | Simulate human operations like click and keyboard presses from code using DLLs.                |                   |
| ->         |    [NewOrder](https://github.com/trollpro0108-code/MQL-SDK/tree/main/docs/terminal/neworder.md)    | modules/terminal/neworder.mqh        | Simulate clicks on the New Order button and windows                                            | 1.0               |
| ->         |    [OneClick](https://github.com/trollpro0108-code/MQL-SDK/tree/main/docs/terminal/oneclick.md)    | modules/terminal/oneclick.mqh        | Simulate clicks on the One Click Window                                                        | 1.0               |
| ->         | [AutoTrading](https://github.com/trollpro0108-code/MQL-SDK/tree/main/docs/terminal/autotrading.md) | modules/terminal/autotrading.mqh     | Toggle the Auto Trading button in the terminal from code                                       | 1.0               |
| ->         |      [KeyMap](https://github.com/trollpro0108-code/MQL-SDK/tree/main/docs/terminal/keymap.md)      | modules/terminal/keymap.mqh          | Detect and return as a string a key pressed by the user                                        | 1.0               |
| ->         |                                               Login                                                | modules/terminal/login.mqh           | Simulate clicks and entries on the Login windows                                               | Under Development |
| `APIs`     |                                                                                                    | `modules/apis.mqh`                   | Allow connection to some of the most famouses APIs                                             |                   |
| ->         |                                              Discord                                               | modules/apis/discord.mqh             | Allow sending data to a discord channel through a Discord Webhook                              | Under Development |
| ->         |                                              Telegram                                              | modules/apis/telegram.mqh            | Allow sending data to a telegram channel using a telegram bot and api key                      | Under Development |
| ->         |                                               Notion                                               | modules/apis/notion.mqh              | Allow sending data to a Notion database                                                        | Under Development |
| ->         |                                                Coda                                                | modules/apis/coda.mqh                | Allow sending data to a coda table (a better alternative than Notion)                          | Under Development |
| ->         |                                               Sheets                                               | modules/apis/sheets.mqh              | Allow sending data to a Google Sheet                                                           | Under Development |
| ->         |                                                News                                                | modules/apis/news.mqh                | Allows you to get information about news in the market                                         | Under Development |
| `Concepts` |                                                                                                    | `modules/concepts.mqh`               | Handle some trading concepts to be used in strategies                                          |                   |
| ->         |                                        [CandlesticksPatterns](https://github.com/trollpro0108-code/MQL-SDK/tree/main/docs/concepts/candlespatterns.md)                                         | modules/concepts/candlespatterns.mqh | Handle candlesticks' patterns                                                                  | 1.0 |
| ->         |                                           ChartPatterns                                            | modules/concepts/chartpatterns.mqh   | Handle chart's patterns                                                                        | Under Development |
| ->         |                                              SRZones                                               | modules/concepts/srzones.mqh         | Handle Support and Resistance zones                                                            | Under Development |
| ->         |                                             Liquidity                                              | modules/concepts/liquidity.mqh       | Handle different liquidity types                                                               | Under Development |
| ->         |                                                OBs                                                 | modules/concepts/obs.mqh             | Handle Order Blocks                                                                            | Under Development |
| ->         |                                              SDZones                                               | modules/concepts/sdzones.mqh         | Handle Supply and Demand Zones                                                                 | Under Development |
| ->         |                                             Imbalance                                              | modules/concepts/imb.mqh             | Handle Imbalances and Inneficiencies in price                                                  |                   |
| `Backtest` |                                                                                                    | `modules/backtest.mqh`               | Allows you lot of functions that will help you during a backtest                               | Under Development |
| ->         |                                              Reports                                               | modules/backtest/reports.mqh         | Allows you to get detailed reports with images about a backtest                                | Under Development |
| ->         |                                             MultiPairs                                             | modules/backtest/multipairs.mqh      | Allows you to run backtest in multiple pairs at once                                           | Under Development |
| ->         |  [TradingMath](https://github.com/trollpro0108-code/MQL-SDK/tree/main/docs/tools/tradingmath.md)   | modules/tools/tradingmath.mqh        | Some functions for an easy calculation of math related to trading like winrate, lot sizes, etc | 1.0               |
| ->         |       [Charts](https://github.com/trollpro0108-code/MQL-SDK/tree/main/docs/tools/charts.md)        | modules/tools/charts.mqh             | Functions to work with charts, like closing, opening, save templates, etc                      | 1.0               |
| -> | [Time Input](https://github.com/trollpro0108-code/MQL-SDK/tree/main/docs/tools/timeInput.md) | modules/tools/timeinput.mqh | Allows you to get a time input from the user | 1.0 |
| ->         |                                               Debug                                                | modules/tools/debug.mqh              | Better Print()s, and other useful debugging functions                                          | Under Development |

# Repository Structure
## Branches
Are 3 branches: `main`, `open`, and `dev`.
* `Main`: This branch will be up-to-date with the last `release`. It doesn't matter if it is an alpha, beta, or stable release.
* `Open`: This branch will be up-to-date with the `main` branch and will accept community improvement. All the pull requests will be reviewed, tested, and merged with the main branch.
* `Dev`: This is the branch I will be using to update the SDK. Do not clone this branch as it contains fatal errors and uncomplete code. After the code get tested, it will be merged with the main branch.

## Releases
Here will be the updated tested code. It will be divided in `beta` and `stable` releases, where beta does compile and got tested a couple of times, and stable compiles, and has been tested at least 5 times.
If you will use the code, and not improve it, always download an `stable release` to avoid bugs in your projects.

## Versions
The release version structure will be `x.yy.zz-<type>`.

### Types
As explained before, it will be `beta` and `stable`.

### Z
An increment in Z means a hotfix, the syntax was not affected and just some logic bugs were fixed.

### Y
An increment in Y could mean improvement of the SDK or a hotfix that change some of the syntax.
Usually means that a new class, module, or package were added to the SDK, but sometimes means that in order to fix a bug the sintax of the class was changed and you must do some adjustment in your projects.

### X
An increment in X means that a whole change was made in the SDK. More packages were added and an optimization of the last code made the code incompatible in more than a module and you must update all youir projects in order to use this new version. Will not be frequent.

### Examples
* Release from v1.2.1 to 1.2.2 - The code syntax is 100% compatible with previews versions, not adjustments in your projects is needed.
* Release from v1.2.2 to 1.3.0 - One of the modules changed its syntax in some way that you must make a few adjustments in your projects.
* Release from v1.3.0 to 2.0.0 - The whole SDK version is mostly incompatible with the previews version. You may keep using the last version or make the jump, but you must do lot of adjustments in your code to update them to the new version.

## Changelogs
You can chack the changelogs by clicking [here](changelogs/index.md).

# FAQs
### **How compatible is it?**
All the packages and modules on an official `release` and `main branch` will be compatible to use in both platforms under the same syntax.

### **A built-in MQL4 function is not in the SDK**
This can be because that function is 100% compatible in MQL5 by default and do not need to be included in the SDK. That way we save disk and memory.

### **My favorite indicator is not compatible**
We are updating the `indicator` moddule of the `mql` package every week with more indicators and even indicators that are not available in Metatrader by default.

### **Can I code my indicators here?**
Yes, you can, however, the SDK is mostly designed for Expert Advisors and Scripts.

### **Can I improve the SDK?**
Of course, this is an open-source SDK and you can contribute in several ways. Here's some examples:
* **By reporting bugs**: This will help us to fix them on future updates.
* **By suggesting**: If you have an idea of a module, package, or feature that you want in the SDK, leave it in the Issues tab and we will implement it.
* **By suggesting libraries**: If you know or even have a library that want to incorporate in the SDK, leave it in the Issues section or make a pull request on the `Open` branch and I will check it out.
* **By improving the actual code**: Maybe optimize it, or adding new functions or classes to actual modules will help.
* **By sharing it**: Sharing the repository is forum will help others developers to reach it, and more developers means more improvements to the project.
