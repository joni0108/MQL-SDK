#include <SDK-MQL/network/sockets.mqh>

#define TIMER_FREQUENCY_MS 1000
#define NONE "NONE\r\n"

//Commands
#define KILL_CONNECTION "KILL_CONNECTION"
#define GET_SIGNAL "GET_SIGNAL"

ServerSocket * master = NULL;
ClientSocket *  clients[];
bool serverCreatedTimer = false;
string comChars = "\r\n";

void DesconnectSocket()
{
   if(master)
   {
      serverCreatedTimer = false;
      
      for(int i = 0; i < ArraySize(clients); i++)
      {
         delete clients[i];
      }
      ArrayResize(clients, 0);
      
      delete master;
      master = NULL;
      Print("Server Terminated");
   }
}

bool CreateSocket()
{
   if(!master)
   {
      master = new ServerSocket(_port, _onlyLocal);
      
      if(!master.Created())
      {
         Print("Failed while creating the server, maybe the port is already in use");
         delete master;
         master = NULL;
         return false;
      }
      else
      {
         Print("The server was created successfully. Listening the port: " + (string)_port);
         serverCreatedTimer = EventSetMillisecondTimer(TIMER_FREQUENCY_MS);
         return true;
      }
   }
   
   Print("The server is already created!");
   return false;
}

void OnConnectEvent()
{
   AcceptNewConnections();
   
   for(int i = ArraySize(clients) - 1; i >= 0; i--)
   {
      HandleSocketIncomingData(i);
   }
}

void ServerOnChartEvent(const int id, const long& lparam)
{
   if(id == CHARTEVENT_KEYDOWN)
   {
      if(lparam == master.GetSocketHandle())
      {
         Print("New server socket event - incomming connection");
         AcceptNewConnections();
      }
      else
      {
         for(int i = 0; i < ArraySize(clients); i++)
         {
            if(lparam == clients[i].GetSocketHandle())
            {
               HandleSocketIncomingData(i);
               return;
            }
         }
      }
   }
}

void AcceptNewConnections()
{
   ClientSocket * client = NULL;
   
   do 
   {
      client = master.Accept();
      
      if(client != NULL)
      {
         int size = ArraySize(clients);
         ArrayResize(clients, size +1);
         clients[size] = client;
         Print("New client connection!");
         
         client.Send("CONNECTION_RECEIVED"+comChars);
      }
   } while (client != NULL);
}

void HandleSocketIncomingData(int clientIndex)
{
   ClientSocket * client = clients[clientIndex];
   
   bool forceClose = false;
   string command;
   
   do
   {
      if(!client.IsSocketConnected())
         command = KILL_CONNECTION;
      else
         command = client.Receive(comChars);
      
      //HANDLE COMMAND
      if(command == KILL_CONNECTION)
         forceClose = true;
      
      else if(command == GET_SIGNAL)
         client.Send(ActualSignal());
         
      else if(command != "")
         Print("<- ", command);
         
   } while (command != "");
   
   //Handle socket close or disconnection of the client
   if(!client.IsSocketConnected() || forceClose)
   {
      delete client;
      
      int countClients = ArraySize(clients);
      
      for(int i = clientIndex + 1; i < countClients; i++)
      {
         clients[i - 1] = clients[i];
         countClients--;
         ArrayResize(clients, countClients);
      }
   }
}

string ActualSignal()
{
   return NONE;
}