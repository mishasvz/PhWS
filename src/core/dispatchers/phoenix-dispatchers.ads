with AWS.Config;
with AWS.Response;
with AWS.Services.Dispatchers.URI;
with AWS.Status;
with Ada.Directories;			use Ada.Directories;
with Ada.Strings.Unbounded;		use Ada.Strings.Unbounded;
with AWS.Messages;
with AWS.MIME;
with AWS.Templates;

with Phoenix;				use Phoenix;
with Phoenix.Config;			use Phoenix.Config;

package Phoenix.Dispatchers is

   use AWS;

   procedure Initialize;

   type Default is new Services.Dispatchers.URI.Handler with private;

   overriding function Dispatch
     (Dispatcher : in Default;
      Request    : in AWS.Status.Data) return AWS.Response.Data;

   type CSS is new AWS.Services.Dispatchers.URI.Handler with private;

   overriding function Dispatch
     (Dispatcher : in CSS;
      Request    : in AWS.Status.Data) return AWS.Response.Data;

   type Image is new AWS.Services.Dispatchers.URI.Handler with private;

   overriding function Dispatch
     (Dispatcher : in Image;
      Request    : in AWS.Status.Data) return AWS.Response.Data;

private

   function LinkPath (URI : String; typ : String) return String;

   type Default is new AWS.Services.Dispatchers.URI.Handler with null record;

   type CSS is new  AWS.Services.Dispatchers.URI.Handler with null record;

   type Image is new  AWS.Services.Dispatchers.URI.Handler with null record;

end Phoenix.Dispatchers;
