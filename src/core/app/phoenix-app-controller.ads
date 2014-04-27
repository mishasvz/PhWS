with AWS.Response;
with AWS.Status;
with AWS.MIME;
with AWS.Templates;
with AWS.Messages;

with Phoenix;
with Phoenix.App;
package Phoenix.App.Controller is

   function Render(File : String; Translation : AWS.Templates.Translate_Set) return AWS.Response.Data;

end Phoenix.App.Controller;
