package body Phoenix.App.Controller.Main is

   function Start (Request : AWS.Status.Data) return AWS.Response.Data is
      URI : constant String := AWS.Status.URI(Request);
      Translations : AWS.Templates.Translate_Set;
      Dat	   : AWS.Response.Data;
   begin
      if URI = "/main/index" then
         IndexAction (Request, Dat);
         return Dat;
      else
         return AWS.Response.Acknowledge (AWS.Messages.S404, "Unknown page");
      end if;
   end Start;

   procedure IndexAction (Request : in AWS.Status.Data; Ret : out AWS.Response.Data) is
      Translations : AWS.Templates.Translate_Set;
   begin
      Ret := Controller.Render("main/index.tmplt", Translations);
   end IndexAction;



end Phoenix.App.Controller.Main;
