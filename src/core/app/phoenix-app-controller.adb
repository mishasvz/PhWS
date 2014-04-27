package body Phoenix.App.Controller is

   function Render(File : String; Translation : AWS.Templates.Translate_Set) return AWS.Response.Data is
   begin
      return AWS.Response.Build
        (AWS.MIME.Text_HTML,
         String'(AWS.Templates.Parse
           (Filename          => Phoenix.Config.Get ("phoenix.www_root") & "/views/" & File,
            Translations      => Translation)));
   end Render;



end Phoenix.App.Controller;
