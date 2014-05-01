package body Phoenix.App.Controller is

   function Render(File 	: String;
                   Translation 	: Translate_Set;
                   Title	: String := Get("phoenix.app.title")) return Data is
      Data 		  : Unbounded_String;
      Translations_Head   : Translate_Set;
      Translations_Footer : Translate_Set;
   begin
      Insert
           (Translations_Head,
            Assoc ("TITLE", Title));

      Data := Data & To_Unbounded_String(Parse(Get("phoenix.www_root") & "/views/layouts/head.tmplt", Translations_Head));
      Data := Data & To_Unbounded_String(Parse(Get ("phoenix.www_root") & "/views/" & File, Translation));
      Data := Data & To_Unbounded_String(Parse(Get("phoenix.www_root") & "/views/layouts/footer.tmplt", Translations_Footer));

      return Build(Text_HTML, To_String(Data));
   end Render;



end Phoenix.App.Controller;
