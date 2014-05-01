with Phoenix;				use Phoenix;
with Phoenix.Utils.Converter;		use Phoenix.Utils.Converter;

with Util.Properties;			use Util.Properties;
with Util.Log.Loggers;			use Util.Log.Loggers;

with Ada.IO_Exceptions;			use Ada.IO_Exceptions;

with AWS.Config.Set;

package Phoenix.Config is

   Phoenix_Config : Manager;

   ConfigLog : constant Logger := Create ("Phoenix.Config");

   procedure Initialize (Config : in String);
   procedure SetupConfig (Config : in Manager'Class);
   function Get (Name    : in String;
                 Default : in String := "") return String;
   procedure Configurate;

end Phoenix.Config;
