# Socket Module
This is a module of the Network package that allows the creation of server sockets, and the connection to server sockets in mql4 and mql5.
This module has 2 classes inside, `ServerSocket` for creating the socket, and `ClientSocket` for connecting to a socket.

## Installation
If you didn't imported all the SDK or the Network module, you can import this module using:
```cpp
#include <MQL-SDK/modules/network/sockets.mqh>
```

# Class ClientSocket
## Methods
```cpp
ClientSocket(ushort localport); //Connects you to a local server socket
ClientSocket(string HostnameOrIPAddress, ushort localport); //Connects you to an online server socket.
bool IsSocketConnected(); //Check if the socket is connected or if the connection was closed or failed.
bool Send(string message); //Send a string message to the socket.
string Receive(); //Gets a string message from the server socket.
```

## Example of Usage
```cpp
//Including the module
#include <MQL-SDK/modules/network/sockets.mqh>

//External Variables
input int port = 8888;

//Creating the connection to the socket with verification.
ClientSocket * glbConnection = NULL;

void OnTick()
{
    //Create a sockt if none already exist
    if(!glbConnection)
    {
        glbConnection = new ClientSocket(port);
    }

    //Check if the socket got connected and it is still running
    if(glbConnection.IsSocketConnected())
    {
        Print("The socket is okay!");
        //Do some actions like sending or receiving.

        //Sending the current symbol name
        string msg = Symbol();
        if(!glbClientSocket.Send(msg))
        {
            Print("Failed while trying to send a message to the socket");
            //.IsSocketConnected() will now return false
        }
        else
        {
            Print("Message sent successfully to the server socket");
        }

        //Get a response from the OnTimer() event for a better performance
        //Receiving a response from the server
        string responseMSG = glbConnection.Receive();
        if(responseMSG != "")
        {
            Print("Response from the server: " + responseMSG);
        }
        else
        {
            //Check if the socket is still active, maybe just didn't send anything, or could be dead already
            if(!glbConnection.IsSocketConnected())
            {
                //Server socket has been closed.
                Print("Socket was closed");
                delete glbConnection;
                glbConnection = NULL;
            }
    }
    else
    {
        //The socket could be dead or the connection has failed
        //Delete the socket and create a new one for a retry
        delete glbConnection;
        glbConnection = NULL;
    }
}
```

## Common Errors
* The port is already in use for other program or socket.
* The server socket has been closed
* The server socket refuses the connection
* The server socket is not opened or never existed. Maybe because the ip is different.
* The server socket not exist. Maybe because the port is different.

# Class ServerSocket
## Methods
```cpp
ServerSocket(ushort ServerPort, bool ForLocalhostOnly); //Opening the server socket.
bool Created(); //Checks if the socket has been created
ClientSocket Accept(); //Accept incomming connections
```

## Usage
```cpp
//Including the module
#include <MQL-SDK/modules/network/sockets.mqh>

//External Variables
input int port = 8888;
input bool onlyLocal = true;

//Creating the connection to the socket with verification.
ServerSocket * MyServer = NULL;

void OnTick()
{
    //Opening the server socket
    if(!MyServer)
    {
        MyServer = new ServerSocket(port, onlyLocal);

        //Check if was created
        if(!MyServer.Created())
        {
            Print("Failed while creating the server, maybe the port is already in use");
            delete MyServer;
            MyServer = NULL;
        }
        else
        {
            Print("The server was created successfully");
            return;
        }
    }
}

void OnTimer()
{
    //Check for a new client
    ClientSocket * pNewClient;

    do 
    {
        pNewClient = MyServer.Accept();
        if(pNewClient)
        {
            // Store client socket for future use.
            // Must remember to delete it when finished, to avoid memory leaks.
        }
    }
    (while pNewClient != NULL);
}

//Closing the server
void OnDeinit(const int reason)
   {
      if (glbServerSocket) delete glbServerSocket;
   }
```

## Common Errors
* The port is already in use for other program or socket.

# Full Wiki
This library was NOT coded by me. It was uploaded to the MQL5 forum and adapted to this SDK. If you want to check the original post, click [here](https://www.mql5.com/en/blogs/post/706665).