with Phoenix;
with Phoenix.App;		use Phoenix.App;
with Phoenix.App.Controller;
package Phoenix.App.Controller.Main is

   function Start (Request : AWS.Status.Data) return AWS.Response.Data;

   procedure IndexAction (Request : in AWS.Status.Data; Ret : out AWS.Response.Data);

end Phoenix.App.Controller.Main;
