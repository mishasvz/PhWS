with AWS.Server;
with AWS.Config;
with AWS.Services.Dispatchers.URI;

with Ada.Command_Line;
with Ada.Strings.Unbounded;

with Util.Log.loggers;

package Phoenix is

   Web_Server         : AWS.Server.HTTP;
   Web_Config         : AWS.Config.Object;
   Web_Dispatcher     : AWS.Services.Dispatchers.URI.Handler;
   Log                : constant Util.Log.Loggers.Logger := Util.Log.Loggers.Create ("Phoenix");

   function CommandLine(Pos : Natural) return String;
end Phoenix;
