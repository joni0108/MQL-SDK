# MQL-SDK
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
However, while using our framework we changed most of the functions and methods to be able to use them cross-platform, so reach our documenation in order to understand how to se them. <br>
Click here to access this **[SDK docummenation](docs/home.md)**

## Getting Started
### Installing the SDK
You can install it manually or using our installation app. See below the instructions for both ways: <br>

**AUTOMATIC**: <br>
1. Download or clone the SDK repository in your computer.
2. Go to the file `setup.exe` and double click it.
3. Follow the instructions in-app to select what to install and what to not. You can select your custom Metatrader app or install the built-in platform provided by FTMO.
4. The app will install the SDK in the FTMO built-in data folder, or in the path provided by you at the installation.
5. Create a new project from the data folder of he app used.
6. In the header of your file, before any other non-comment line, copy and paste the line below:

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

### Default Paths
The path below are the path for the metatraders provided by FTMO included in the SDK, if you installed your own metatrader, find the path by opening the metatrader, click in Files->Open Data Folder.

**MT4 DATA PATH**:
`C:\Users\<USER NAME>\AppData\Roaming\MetaQuotes\Terminal\2C68BEE3A904BDCEE3EEF5A5A77EC162\MQL4`

**MT5 DATA PATH**:
`C:\Users\<USER NAME>\AppData\Roaming\MetaQuotes\Terminal\49CDDEAA95A409ED22BD2287BB67CB9C\MQL5`

## Docummentation
Access the documentation files in MD format by clicking [here](docs/home.md)

### Modules
|   From    | Module Name  | Description                                          |
| :-------: | :----------: | :--------------------------------------------------- |
|   `mql`   |  `account`   | Import all account-related data and operations       |
|   `mql`   |  `terminal`  | Import all terminal-related data and operations      |
|   `mql`   |   `market`   | Import all market-related data and operations        |
|   `mql`   |   `trade`    | Import all trade-related data and operations         |
|   `mql`   | `indicators` | Import all indicators-related data and operations    |

### Under Development
|   From    | Module Name  | Description                                          |
| :-------: | :----------: | :--------------------------------------------------- |
| `network` |  `sockets`   | Allow working with web sockets.
| `api` |  `discord`   | Allow working with the discord API.
| `api` |  `telegram`   | Allow working with the telegram API.
| `api` | `newsapi`   | Allow working with the newsapi API of news providers.
`api` | `googlesheets` | Allow working with the google sheets API.

## TODO -> Before next updates
- [ ] Finish the documentation of the SDK.
- [ ] Add the errors handlers to the 'Trade' module.
- [ ] Finish the `sockets` and `api` module.