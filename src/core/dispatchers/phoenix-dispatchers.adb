with Ada.Text_IO;
package body Phoenix.Dispatchers is

   Web_Root : Ada.Strings.Unbounded.Unbounded_String;
   Css_Root : Ada.Strings.Unbounded.Unbounded_String;
   Img_Root : Ada.Strings.Unbounded.Unbounded_String;
   Stc_Root : Ada.Strings.Unbounded.Unbounded_String;
   Scr_Root : Ada.Strings.Unbounded.Unbounded_String;

   function LinkPath (URI : String; typ : String) return String is
      File	: Ada.Strings.Unbounded.Unbounded_String;
      Position	: Positive;
      Len	: Natural;
      FileS	: Ada.Strings.Unbounded.Unbounded_String;
   begin
      File := Ada.Strings.Unbounded.To_Unbounded_String (URI (URI'First + 1 .. URI'Last));
      Position := Ada.Strings.Unbounded.Index (File, "/");
      Len := Ada.Strings.Unbounded.Length (File);
      if typ = "css" then
         FileS := Web_Root & Css_Root;
      else if typ = "image" then
            FileS := Web_Root & Img_Root;
         end if;
      end if;
      return Ada.Strings.Unbounded.To_String (FileS) & Ada.Strings.Unbounded.Slice (File, Position, Len);
   end LinkPath;


   overriding function Dispatch
     (Dispatcher : in Default; Request : in AWS.Status.Data) return AWS.Response.Data
   is
      pragma Unreferenced (Dispatcher);
      URI          : constant String := AWS.Status.URI (Request);
      Translations : AWS.Templates.Translate_Set;
      New_URI	   : Ada.Strings.Unbounded.Unbounded_String;
      Position	   : Positive;
      Len	   : Natural;
      Ext	   : Ada.Strings.Unbounded.Unbounded_String;
   begin
      New_URI := Ada.Strings.Unbounded.To_Unbounded_String (URI);
      Position := Ada.Strings.Unbounded.Index (New_URI, ".");
      Len := Ada.Strings.Unbounded.Length (New_URI);
      Ada.Text_IO.Put_Line (Ada.Strings.Unbounded.Slice(New_URI, Position, Len));
      if URI = "/" then
         AWS.Templates.Insert
           (Translations,
            AWS.Templates.Assoc ("MESSAGE", "This is the main page"));

         return AWS.Response.Build
           (AWS.MIME.Text_HTML,
            String'(AWS.Templates.Parse
              (Filename     => Ada.Strings.Unbounded.To_String (Web_Root) & "/tmplt/main.thtml",
               Translations => Translations)));

      else
         if Ada.Directories.Exists(To_String (Web_Root) & URI & ".html") = true then
            return AWS.Response.Build
              (AWS.MIME.Text_HTML,
               String'(AWS.Templates.Parse
                 (Filename     => Ada.Strings.Unbounded.To_String (Web_Root) & URI & ".html",
                  Translations => Translations)));
         else
	    return AWS.Response.Acknowledge (Messages.S404, "Unknown page");
         end if;

      end if;
   end Dispatch;

   overriding function Dispatch
     (Dispatcher : in CSS;
      Request    : in AWS.Status.Data) return AWS.Response.Data
   is
      pragma Unreferenced (Dispatcher);
      URI	: constant String := AWS.Status.URI (Request);
      File	: constant String := LinkPath(URI, "css");
   begin
      if Ada.Directories.Exists (File) then
         return AWS.Response.File
           (Content_Type => AWS.MIME.Text_CSS,
            Filename     => File);
      else
         return AWS.Response.Acknowledge (Messages.S404);
      end if;
   end Dispatch;

   overriding function Dispatch
     (Dispatcher : in Image;
      Request    : in AWS.Status.Data) return AWS.Response.Data
   is
      pragma Unreferenced (Dispatcher);
      URI  	: constant String := AWS.Status.URI (Request);
      File	: constant String := LinkPath(URI, "image");
   begin
      if Ada.Directories.Exists (File) then
         return AWS.Response.File
           (Content_Type => AWS.MIME.Content_Type (File),
            Filename     => File);
      else
         return AWS.Response.Acknowledge (Messages.S404);
      end if;
   end Dispatch;

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize is
   begin
      Web_Root := To_Unbounded_String (Get ("phoenix.www_root"));
      Css_Root := To_Unbounded_String (Get ("phoenix.css_dir"));
      Img_Root := To_Unbounded_String (Get ("phoenix.image_dir"));
      Stc_Root := To_Unbounded_String (Get ("phoenix.static_dir"));
      Scr_Root := To_Unbounded_String (Get ("phoenix.static_dir"));
   end Initialize;

end Phoenix.Dispatchers;
