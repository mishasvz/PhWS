package body Phoenix.Dispatchers is

   Web_Root : Unbounded_String;

   overriding function Dispatch
     (Dispatcher : in Default; Request : in AWS.Status.Data) return AWS.Response.Data
   is
      pragma Unreferenced (Dispatcher);
      URI          : constant String := AWS.Status.URI (Request);
      Translations : Translate_Set;
      Ext	   : String := AWS.MIME.Content_Type(URI);
      File	   : constant String := To_String (Web_Root) & URI;
   begin
      if Ext /= "application/octet-stream" then
         if Exists (File) then
            return AWS.Response.File(Content_Type => Ext, Filename => File);
         else
            return Acknowledge (S404, "Unknown page");
         end if;
      else if URI = "/" then
         Insert
           (Translations,
            Assoc ("MESSAGE", "This is the main page"));

         return Build
           (Text_HTML,
            String'(Parse
              (Filename     => To_String (Web_Root) & "/tmplt/main.thtml",
               Translations => Translations)));
         else if Exists(To_String (Web_Root) & URI & ".html") = true then
               return Build
                 (Text_HTML,
                  String'(Parse
                    (Filename     => To_String (Web_Root) & URI & ".html",
                     Translations => Translations)));
            else
               return Acknowledge (S404, "Unknown page");
            end if;
         end if;
      end if;
   end Dispatch;

   procedure Initialize is
   begin
      Web_Root := To_Unbounded_String (Phoenix.Config.Get ("phoenix.www_root"));
   end Initialize;

end Phoenix.Dispatchers;
