package body Phoenix.SQL is

   procedure Connect is
   begin
      ADO.Drivers.Initialize ("mysql.conf");
      Factory.Create (ADO.Drivers.Get_Config ("ado.database"));

      DB := Factory.Get_Master_Session;
      --DB.Begin_Transaction;
      --Question.Set_Title ("How can we build an application?");
      --Question.Set_Author ("Iorek");
      --Question.Set_Text ("I need to build this Ada application. How should I do this?");
      --Question.Set_Create_Date (Ada.Calendar.Clock);
      --Question.Save (DB);
      --DB.Commit;

      --DB.Begin_Transaction;
      --Answer.Set_Question (Question);
      --Answer.Set_Author ("Lyra");
      --Answer.Set_Text ("You can use 'gnatmake -Pdemo' to build");
      --Answer.Save (DB);
      --DB.Commit;
   end Connect;

end Phoenix.SQL;
