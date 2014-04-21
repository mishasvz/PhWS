with AWS.Response;
with AWS.Status;
with AWS.Digest;
with AWS.Config;
with Ada.Text_IO;

with Phoenix;
with Phoenix.Config;

package Phoenix.Admin is

   Auth_Mode : AWS.Response.Authentication_Mode := AWS.Response.Digest;

   function Get (Request : AWS.Status.Data) return AWS.Response.Data;

end Phoenix.Admin;
