#include <MQL-SDK/modules/network/sockets.mqh>

//Commands
#define KILL_CONNECTION "KILL_CONNECTION"
#define GET_SIGNAL "GET_SIGNAL"
#define NONE "NONE"

ClientSocket * client = NULL;
string comChars = "\r\n";

void DesconnectSocket()
{
   if(client)
   {
      delete client;
      client = NULL;
   }
}

bool ConnectSocket()
{
   if(!client)
   {
      client = new ClientSocket(_hostname, _port);
      
      if(client.IsSocketConnected())
      {
         Print("Socket Connected - Hostname: " + _hostname + " - Port: " + (string)_port);
         
         if(client.Receive(comChars) == "CONNECTION_RECEIVED"+comChars)
         {
            Print("Able to receive further messages");
            return true;
         }
         
         return true;
      }
      else
      {
         Print("Socket connection has failed. Host: " + _hostname + ":" + (string)_port);
         return false;
      }
   }
   else
   {
      Print("The socket is already connected! - Host: " + _hostname + ":" + (string)_port);
      return false;
   }
}

void OnConnectEvent()
{
   if(!client.IsSocketConnected())
   {
      Print("The socket is not yet connected or has been desconnected");
      
      Sleep(5000);
      Print("Trying to reconnect...");
      
      DesconnectSocket();
      ConnectSocket();
      
      return;
   }
   
   string command = GET_SIGNAL;
   
   client.Send(command+comChars);
   
   //Check for a message back
   string response = client.Receive(comChars);
   
   if(response == NONE)
      Print("No new signal update");
   else
      Print(response);
}