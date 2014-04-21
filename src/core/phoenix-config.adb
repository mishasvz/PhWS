package body Phoenix.Config is

   procedure Initialize (Config : in String) is
   begin
      ConfigLog.Info ("Read server config file: {0}", Config);

      begin
         Util.Properties.Load_Properties (Phoenix_Config, Config);
      exception
         when Ada.IO_Exceptions.Name_Error =>
            ConfigLog.Error ("Configuration file '{0}' does not exist", Config);
      end;

      SetupConfig (Phoenix_Config);
   end Initialize;

   procedure SetupConfig (Config : in Util.Properties.Manager'Class) is
   begin
      Phoenix_Config := Util.Properties.Manager (Config);
   end SetupConfig;

   function Get (Name    : in String;
                 Default : in String := "") return String is
   begin
      return Phoenix_Config.Get (Name, Default);
   end Get;

   procedure Configurate is
   begin
      AWS.Config.Set.Server_Name (Phoenix.Web_Config, Get ("phoenix.name"));
      AWS.Config.Set.WWW_Root (Phoenix.Web_Config, Get ("phoenix.www_root"));
      AWS.Config.Set.Admin_URI (Phoenix.Web_Config, Get ("phoenix.admin.uri"));
      AWS.Config.Set.Admin_Password (Phoenix.Web_Config, Get ("phoenix.admin.password"));
      --AWS.Config.Set.Admin_Realm (Phoenix.Web_Config, Get ("phoenix.admin.realm")); -- set function unavailable
      AWS.Config.Set.Server_Host (Phoenix.Web_Config, Get ("phoenix.host"));
      AWS.Config.Set.Server_Port (Phoenix.Web_Config, Phoenix.Utils.Converter.To_Natural (Get ("phoenix.port")));
      AWS.Config.Set.Hotplug_Port (Phoenix.Web_Config, Phoenix.Utils.Converter.To_Positive (Get ("phoenix.hotplug.port")));
      AWS.Config.Set.Max_Connection (Phoenix.Web_Config, Phoenix.Utils.Converter.To_Positive (Get ("phoenix.max_connection")));
      --AWS.Config.Set.Send_Buffer_Size (Phoenix.Web_Config, Phoenix.Utils.Converter.To_Positive (Get ("phoenix.send_buffer_size"))); -- bad input data
      AWS.Config.Set.Free_Slots_Keep_Alive_Limit (Phoenix.Web_Config, Phoenix.Utils.Converter.To_Natural (Get ("phoenix.free_slots_keep_alive_limit")));
      AWS.Config.Set.Keep_Alive_Force_Limit (Phoenix.Web_Config, Phoenix.Utils.Converter.To_Natural (Get ("phoenix.keep_alive_force_limit")));
      --AWS.Config.Set.Keep_Alive_Close_Limit (Phoenix.Web_Config, Phoenix.Utils.Converter.To_Natural (Get ("phoenix.keep_alive_close_limit"))); -- set function unavailable
      AWS.Config.Set.Accept_Queue_Size (Phoenix.Web_Config, Phoenix.Utils.Converter.To_Positive (Get ("phoenix.accept_queue_size")));
      AWS.Config.Set.Upload_Directory (Phoenix.Web_Config, Get ("phoenix.upload.directory"));
      AWS.Config.Set.Upload_Size_Limit(Phoenix.Web_Config, Phoenix.Utils.Converter.To_Positive (Get ("phoenix.upload.size_limit")));
      AWS.Config.Set.Line_Stack_Size (Phoenix.Web_Config, Phoenix.Utils.Converter.To_Positive (Get ("phoenix.line_stack_size")));
      --AWS.Config.Set.Case_Sensitive_Parameters (Phoenix.Web_Config, Phoenix.Utils.Converter.To_Boolean ( Get ("phoenix.case_sensitive_parameters"))); -- bad input data
      --AWS.Config.Set.Input_Line_Size_Limit (Phoenix.Web_Config, Phoenix.Utils.Converter.To_Positive (Get ("phoenix.input_line_size_limit"))); -- set function unavailable
      --AWS.Config.Set.Max_Concurrent_Download (Phoenix.Utils.Converter.To_Positive (Get ("phoenix.max_concurrent_download")));
      AWS.Config.Set.Reuse_Address (Phoenix.Web_Config, Phoenix.Utils.Converter.To_Boolean (Get ("phoenix.reuse_address")));
      AWS.Config.Set.MIME_Types (Phoenix.Web_Config, Get ("phoenix.mime_types"));
      --AWS.Config.Set.User_Agent (Phoenix.Web_Config, Get ("phoenix.user_agent")); -- set function unavailable
      AWS.Config.Set.Session (Phoenix.Web_Config, Phoenix.Utils.Converter.To_Boolean (Get ("phoenix.session")));
      AWS.Config.Set.Session_Name (Phoenix.Web_Config, Get ("phoenix.session.name"));
      --AWS.Config.Set.Cleanup_Interval (Phoenix.Web_Config, Phoenix.Utils.Converter.To_Duration (Get ("phoenix.session.cleanup_interval"))); -- set function unavailable
      AWS.Config.Set.Session_Lifetime (Phoenix.Utils.Converter.To_Duration (Get ("phoenix.session.lifetime")));
      AWS.Config.Set.Context_Lifetime (Phoenix.Utils.Converter.To_Duration (Get ("phoenix.context.lifetime")));
      AWS.Config.Set.Transient_Cleanup_Interval (Phoenix.Utils.Converter.To_Duration (Get ("phoenix.transient.cleanup_interval")));
      AWS.Config.Set.Transient_Lifetime (Phoenix.Utils.Converter.To_Duration (Get ("phoenix.transient.lifetime")));
      AWS.Config.Set.Cleaner_Wait_For_Client_Timeout (Phoenix.Web_Config, Phoenix.Utils.Converter.To_Duration (Get ("phoenix.timeout.cleaner.wait_for_client")));
      AWS.Config.Set.Cleaner_Client_Header_Timeout (Phoenix.Web_Config, Phoenix.Utils.Converter.To_Duration (Get ("phoenix.timeout.cleaner.client_header")));
      AWS.Config.Set.Cleaner_Client_Data_Timeout (Phoenix.Web_Config, Phoenix.Utils.Converter.To_Duration (Get ("phoenix.timeout.cleaner.client_data")));
      AWS.Config.Set.Cleaner_Server_Response_Timeout (Phoenix.Web_Config, Phoenix.Utils.Converter.To_Duration (Get ("phoenix.timeout.cleaner.server_response")));
      AWS.Config.Set.Force_Wait_For_Client_Timeout (Phoenix.Web_Config, Phoenix.Utils.Converter.To_Duration (Get ("phoenix.timeout.force.wait_for_client")));
      AWS.Config.Set.Force_Client_Header_Timeout (Phoenix.Web_Config, Phoenix.Utils.Converter.To_Duration (Get ("phoenix.timeout.force.client_header")));
      AWS.Config.Set.Force_Client_Data_Timeout (Phoenix.Web_Config, Phoenix.Utils.Converter.To_Duration (Get ("phoenix.timeout.force.client_data")));
      AWS.Config.Set.Force_Server_Response_Timeout (Phoenix.Web_Config, Phoenix.Utils.Converter.To_Duration (Get ("phoenix.timeout.force.server_response")));
      AWS.Config.Set.Send_Timeout (Phoenix.Web_Config, Phoenix.Utils.Converter.To_Duration (Get ("phoenix.timeout.send")));
      AWS.Config.Set.Receive_Timeout (Phoenix.Web_Config, Phoenix.Utils.Converter.To_Duration (Get ("phoenix.timeout.receive")));
      AWS.Config.Set.Directory_Browser_Page (Phoenix.Web_Config, Get ("phoenix.template.directory_browser_page"));
      AWS.Config.Set.Status_Page (Phoenix.Web_Config, Get ("phoenix.template.status_page"));
      AWS.Config.Set.Up_Image (Phoenix.Web_Config, Get ("phoenix.template.up_image"));
      AWS.Config.Set.Down_Image (Phoenix.Web_Config, Get ("phoenix.template.down_image"));
      AWS.Config.Set.Logo_Image (Phoenix.Web_Config, Get ("phoenix.template.logo_image"));
      AWS.Config.Set.Security (Phoenix.Web_Config, Phoenix.Utils.Converter.To_Boolean (Get ("phoenix.security")));
      AWS.Config.Set.Security_Mode (Phoenix.Web_Config, Get ("phoenix.security.mode"));
      AWS.Config.Set.Certificate (Phoenix.Web_Config, Get ("phoenix.security.certificate"));
      AWS.Config.Set.Key (Phoenix.Web_Config, Get ("phoenix.security.key"));
      --AWS.Config.Set.Client_Certificate (Phoenix.Web_Config, Get ("phoenix.security.client_certificate")); -- set function unavailable
      AWS.Config.Set.Exchange_Certificate (Phoenix.Web_Config, Phoenix.Utils.Converter.To_Boolean (Get ("phoenix.security.exchange_certificate")));
      AWS.Config.Set.Check_URL_Validity (Phoenix.Web_Config, Phoenix.Utils.Converter.To_Boolean (Get ("phoenix.security.check_url_validity")));
   end Configurate;



end Phoenix.Config;
