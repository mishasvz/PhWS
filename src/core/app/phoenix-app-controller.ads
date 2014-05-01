with Ada.Strings.Unbounded;		use Ada.Strings.Unbounded;

with AWS.Response;			use AWS.Response;
with AWS.Status;
with AWS.MIME;				use AWS.MIME;
with AWS.Templates;			use AWS.Templates;
with AWS.Messages;

with Phoenix;
with Phoenix.App;
with Phoenix.Config;			use Phoenix.Config;
package Phoenix.App.Controller is

   function Render(File 	: String;
                   Translation 	: Translate_Set;
                   Title	: String := Get("phoenix.app.title")) return Data;

end Phoenix.App.Controller;
