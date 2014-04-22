with Ada.Text_IO;
with Ada.Strings.Unbounded.Text_IO;
with Ada.Integer_Text_IO;

package body Phoenix.Dispatchers is

   Web_Root : Ada.Strings.Unbounded.Unbounded_String;

   overriding function Dispatch
     (Dispatcher : in Default; Request : in AWS.Status.Data) return AWS.Response.Data
   is
      pragma Unreferenced (Dispatcher);
      URI          : constant String := AWS.Status.URI (Request);
      Translations : AWS.Templates.Translate_Set;
      Ext	   : String := AWS.MIME.Content_Type(URI);
      File	   : constant String := Ada.Strings.Unbounded.To_String (Web_Root) & URI;
   begin
      Ada.Text_IO.Put_Line(Ext);
      if Ext /= "application/octet-stream" then
         if Ada.Directories.Exists (File) then
            return AWS.Response.File(Content_Type => Ext, Filename => File);
         else
            return AWS.Response.Acknowledge (Messages.S404, "Unknown page");
         end if;
      else if URI = "/" then
         AWS.Templates.Insert
           (Translations,
            AWS.Templates.Assoc ("MESSAGE", "This is the main page"));

         return AWS.Response.Build
           (AWS.MIME.Text_HTML,
            String'(AWS.Templates.Parse
              (Filename     => Ada.Strings.Unbounded.To_String (Web_Root) & "/tmplt/main.thtml",
               Translations => Translations)));
         else if Ada.Directories.Exists(To_String (Web_Root) & URI & ".html") = true then
               return AWS.Response.Build
                 (AWS.MIME.Text_HTML,
                  String'(AWS.Templates.Parse
                    (Filename     => Ada.Strings.Unbounded.To_String (Web_Root) & URI & ".html",
                     Translations => Translations)));
            else
               return AWS.Response.Acknowledge (Messages.S404, "Unknown page");
            end if;
         end if;
      end if;
   end Dispatch;

   procedure Initialize is
   begin
      Web_Root := Ada.Strings.Unbounded.To_Unbounded_String (Phoenix.Config.Get ("phoenix.www_root"));
   end Initialize;

end Phoenix.Dispatchers;
