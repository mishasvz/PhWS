with AWS.Config;
with AWS.Response;			use AWS.Response;
with AWS.Services.Dispatchers.URI;	use AWS.Services.Dispatchers.URI;
with AWS.Status;			use AWS.Status;
with Ada.Directories;			use Ada.Directories;
with Ada.Strings.Unbounded;		use Ada.Strings.Unbounded;
with AWS.Messages;			use AWS.Messages;
with AWS.MIME;				use AWS.MIME;
with AWS.Templates;			use AWS.Templates;

with Phoenix;
with Phoenix.Config;

package Phoenix.Dispatchers is

   procedure Initialize;

   type Default is new Handler with private;

   overriding function Dispatch
     (Dispatcher : in Default;
      Request    : in AWS.Status.Data) return AWS.Response.Data;

private

   type Default is new Handler with null record;

end Phoenix.Dispatchers;
