with Ada.Text_IO;			use Ada.Text_IO;
with Ada.Command_Line;			use Ada.Command_Line;

with AWS.Server;			use AWS.Server;
with AWS.Config;
with AWS.Services.Dispatchers.URI;	use AWS.Services.Dispatchers.URI;

with Phoenix;
with Phoenix.App;
with Phoenix.SQL;
with Phoenix.Admin;
with Phoenix.Config;
with Phoenix.Dispatchers;
with Phoenix.App.Controller;
with Phoenix.App.Controller.Main;

with Util.Log.loggers;			use Util.Log.Loggers;

procedure Phoenix.Main is

   procedure Start;
   procedure Stop;
   procedure RunLog;
   procedure ReadConfig(Name : String);
   procedure SetupDispatch;
   procedure RunSQL;

   procedure Start is
   begin
      SetupDispatch;
      Start(Phoenix.Web_Server, Phoenix.Web_Dispatcher, Phoenix.Web_Config);
      Info(Phoenix.Log,"Start Phoenix Web Server");
      RunSQL;
      Wait(AWS.Server.Q_Key_Pressed);
      Stop;
   end Start;

   procedure Stop is
   begin
      Shutdown(Phoenix.Web_Server);
      Info(Phoenix.Log,"Stop Phoenix Web Server");
   end Stop;

   procedure RunLog is
   begin
      Initialize(CommandLine(1));
      Info(Phoenix.Log,"Start logging");
   end RunLog;

   procedure ReadConfig(Name : String) is
   begin
      Info(Phoenix.Log,"Read server config file");
      Phoenix.Config.Initialize(Name);
      Phoenix.Config.Configurate;
   end ReadConfig;

   procedure SetupDispatch is
      Default_Dispatcher : Phoenix.Dispatchers.Default;
   begin
      Info(Phoenix.Log,"Setup dispatchers");
      Phoenix.Dispatchers.Initialize;
      Register(Phoenix.Web_Dispatcher, "/admin", Phoenix.Admin.Get'Access, True);
      Register(Phoenix.Web_Dispatcher, "/main", Phoenix.App.Controller.Main.Start'Access, True);
      Register_Default_Callback(Phoenix.Web_Dispatcher, Default_Dispatcher);
   end SetupDispatch;

   procedure RunSQL is
   begin
      Phoenix.SQL.Connect;
   end RunSQL;


begin
   if Argument_Count /= 0 then
      ReadConfig(Phoenix.CommandLine(1));
      RunLog;
      Start;
   else
      Put_Line(" -------------------------------------------------------------- ");
      Put_Line("|      Phoenix Web Server based on Ada Web Server v" & AWS.Version & "      |");
      Put_Line("|   For running web-server please run command from superuser   |");
      Put_Line("|      ~# ./phoenix -c:<name config file with extensions>      |");
      Put_Line("| Development by Misha Serenkov (http://vk.com/misha_serenkov) |");
      Put_Line(" -------------------------------------------------------------- ");
   end if;
end Phoenix.Main;
