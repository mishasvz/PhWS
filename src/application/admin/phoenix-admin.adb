package body Phoenix.Admin is

   Auth_Username : constant String := "Administrator";

   ---------
   -- Get --
   ---------

   function Get (Request : AWS.Status.Data) return AWS.Response.Data is
      use type AWS.Response.Authentication_Mode;
      use type AWS.Status.Authorization_Type;

      Username      : constant String := AWS.Status.Authorization_Name (Request);
      Auth_Password : constant String := AWS.Config.Admin_Password(Phoenix.Web_Config);
      Auth_Realm    : constant String := Phoenix.Config.Get("phoenix.admin.realm");
   begin
      if Username = Auth_Username
        and then AWS.Status.Check_Digest (Request, Auth_Password)
      then
         if AWS.Digest.Check_Nonce
              (AWS.Status.Authorization_Nonce (Request))
         then
            return AWS.Response.Build
              ("text/html",
               "<p>Digest authorization OK!<br>"
                 & AWS.Status.Authorization_NC (Request));
         else
            --  Nonce is stale
            return AWS.Response.Authenticate
              (Auth_Realm, Auth_Mode, Stale => True);
         end if;
      else
         --  Unauthorized
         return AWS.Response.Authenticate (Auth_Realm, Auth_Mode);
      end if;
   end Get;

end Phoenix.Admin;
