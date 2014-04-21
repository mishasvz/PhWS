with AWS.Server;
with AWS.Config;
with AWS.Services.Dispatchers.URI;

with Phoenix;
with Phoenix.Admin;
with Phoenix.Config;
with Phoenix.Dispatchers;

with Util.Log.loggers;

with Ada.Text_IO;
with Ada.Command_Line;

procedure Phoenix.Main is

   procedure Start;
   procedure Stop;
   procedure RunLog;
   procedure ReadConfig(Name : String);
   procedure SetupDispatch;

   procedure Start is
   begin
      SetupDispatch;
      AWS.Server.Start(Web_Server => Phoenix.Web_Server,
                       Dispatcher => Phoenix.Web_Dispatcher,
                       Config     => Phoenix.Web_Config);
      Util.Log.Loggers.Info(Phoenix.Log,"Start Phoenix Web Server");
      AWS.Server.Wait(AWS.Server.Q_Key_Pressed);
      Stop;
   end Start;

   procedure Stop is
   begin
      AWS.Server.Shutdown(Phoenix.Web_Server);
      Util.Log.Loggers.Info(Phoenix.Log,"Stop Phoenix Web Server");
   end Stop;

   procedure RunLog is
   begin
      Util.Log.Loggers.Initialize(Phoenix.CommandLine(1));
      Util.Log.Loggers.Info(Phoenix.Log,"Start logging");
   end RunLog;

   procedure ReadConfig(Name : String) is
   begin
      Util.Log.Loggers.Info(Phoenix.Log,"Read server config file");
      Phoenix.Config.Initialize(Name);
      Phoenix.Config.Configurate;
   end ReadConfig;

   procedure SetupDispatch is
      Default_Dispatcher : Phoenix.Dispatchers.Default;
      CSS_Dispatcher     : Phoenix.Dispatchers.CSS;
      Image_Dispatcher   : Phoenix.Dispatchers.Image;
   begin
      Util.Log.Loggers.Info(Phoenix.Log,"Setup dispatchers");
      Phoenix.Dispatchers.Initialize;
      AWS.Services.Dispatchers.URI.Register
        (Phoenix.Web_Dispatcher,
         URI    => "/css",
         Action => CSS_Dispatcher,
         Prefix => True);
      AWS.Services.Dispatchers.URI.Register
        (Phoenix.Web_Dispatcher,
         URI    => "/img",
         Action => Image_Dispatcher,
         Prefix => True);
      AWS.Services.Dispatchers.URI.Register
        (Phoenix.Web_Dispatcher,
         URI    => "/admin",
         Action => Phoenix.Admin.Get'Access,
         Prefix => True);
      AWS.Services.Dispatchers.URI.Register_Default_Callback
        (Phoenix.Web_Dispatcher,
         Action => Default_Dispatcher);
   end SetupDispatch;

begin
   if Ada.Command_Line.Argument_Count /= 0 then
      ReadConfig(Phoenix.CommandLine(1));
      RunLog;
      Start;
   else
      Ada.Text_IO.Put_Line(" -------------------------------------------------------------- ");
      Ada.Text_IO.Put_Line("|      Phoenix Web Server based on Ada Web Server v" & AWS.Version & "      |");
      Ada.Text_IO.Put_Line("|   For running web-server please run command from superuser   |");
      Ada.Text_IO.Put_Line("|      ~# ./phoenix -c:<name config file with extensions>      |");
      Ada.Text_IO.Put_Line("| Development by Misha Serenkov (http://vk.com/misha_serenkov) |");
      Ada.Text_IO.Put_Line(" -------------------------------------------------------------- ");
   end if;
end Phoenix.Main;
