-----------------------------------------------------------------------
--  demo.Models -- demo.Models
-----------------------------------------------------------------------
--  File generated by ada-gen DO NOT MODIFY
--  Template used: templates/model/package-body.xhtml
--  Ada Generator: https://ada-gen.googlecode.com/svn/trunk Revision 1095
-----------------------------------------------------------------------
--  Copyright (C) 2013 Iorek.Byrnison
--  Written by Iorek.Byrnison (Iorek.Byrnison@svalbard.com)
--
--  Licensed under the Apache License, Version 2.0 (the "License");
--  you may not use this file except in compliance with the License.
--  You may obtain a copy of the License at
--
--      http://www.apache.org/licenses/LICENSE-2.0
--
--  Unless required by applicable law or agreed to in writing, software
--  distributed under the License is distributed on an "AS IS" BASIS,
--  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--  See the License for the specific language governing permissions and
--  limitations under the License.
-----------------------------------------------------------------------
with Ada.Unchecked_Deallocation;
with Util.Beans.Objects.Time;
package body demo.Models is

   use type ADO.Objects.Object_Record_Access;
   use type ADO.Objects.Object_Ref;
   use type ADO.Objects.Object_Record;

   function Question_Key (Id : in ADO.Identifier) return ADO.Objects.Object_Key is
      Result : ADO.Objects.Object_Key (Of_Type  => ADO.Objects.KEY_INTEGER,
                                       Of_Class => QUESTION_DEF'Access);
   begin
      ADO.Objects.Set_Value (Result, Id);
      return Result;
   end Question_Key;

   function Question_Key (Id : in String) return ADO.Objects.Object_Key is
      Result : ADO.Objects.Object_Key (Of_Type  => ADO.Objects.KEY_INTEGER,
                                       Of_Class => QUESTION_DEF'Access);
   begin
      ADO.Objects.Set_Value (Result, Id);
      return Result;
   end Question_Key;

   function "=" (Left, Right : Question_Ref'Class) return Boolean is
   begin
      return ADO.Objects.Object_Ref'Class (Left) = ADO.Objects.Object_Ref'Class (Right);
   end "=";

   procedure Set_Field (Object : in out Question_Ref'Class;
                        Impl   : out Question_Access) is
      Result : ADO.Objects.Object_Record_Access;
   begin
      Object.Prepare_Modify (Result);
      Impl := Question_Impl (Result.all)'Access;
   end Set_Field;

   --  Internal method to allocate the Object_Record instance
   procedure Allocate (Object : in out Question_Ref) is
      Impl : Question_Access;
   begin
      Impl := new Question_Impl;
      Impl.Version := 0;
      Impl.Create_Date := ADO.DEFAULT_TIME;
      Impl.Update_Date.Is_Null := True;
      ADO.Objects.Set_Object (Object, Impl.all'Access);
   end Allocate;

   -- ----------------------------------------
   --  Data object: Question
   -- ----------------------------------------

   procedure Set_Id (Object : in out Question_Ref;
                     Value  : in ADO.Identifier) is
      Impl : Question_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_Key_Value (Impl.all, 1, Value);
   end Set_Id;

   function Get_Id (Object : in Question_Ref)
                  return ADO.Identifier is
      Impl : constant Question_Access := Question_Impl (Object.Get_Object.all)'Access;
   begin
      return Impl.Get_Key_Value;
   end Get_Id;


   function Get_Version (Object : in Question_Ref)
                  return Integer is
      Impl : constant Question_Access := Question_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Version;
   end Get_Version;


   procedure Set_Title (Object : in out Question_Ref;
                         Value : in String) is
      Impl : Question_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_String (Impl.all, 3, Impl.Title, Value);
   end Set_Title;

   procedure Set_Title (Object : in out Question_Ref;
                        Value  : in Ada.Strings.Unbounded.Unbounded_String) is
      Impl : Question_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_Unbounded_String (Impl.all, 3, Impl.Title, Value);
   end Set_Title;

   function Get_Title (Object : in Question_Ref)
                 return String is
   begin
      return Ada.Strings.Unbounded.To_String (Object.Get_Title);
   end Get_Title;
   function Get_Title (Object : in Question_Ref)
                  return Ada.Strings.Unbounded.Unbounded_String is
      Impl : constant Question_Access := Question_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Title;
   end Get_Title;


   procedure Set_Text (Object : in out Question_Ref;
                        Value : in String) is
      Impl : Question_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_String (Impl.all, 4, Impl.Text, Value);
   end Set_Text;

   procedure Set_Text (Object : in out Question_Ref;
                       Value  : in Ada.Strings.Unbounded.Unbounded_String) is
      Impl : Question_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_Unbounded_String (Impl.all, 4, Impl.Text, Value);
   end Set_Text;

   function Get_Text (Object : in Question_Ref)
                 return String is
   begin
      return Ada.Strings.Unbounded.To_String (Object.Get_Text);
   end Get_Text;
   function Get_Text (Object : in Question_Ref)
                  return Ada.Strings.Unbounded.Unbounded_String is
      Impl : constant Question_Access := Question_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Text;
   end Get_Text;


   procedure Set_Create_Date (Object : in out Question_Ref;
                              Value  : in Ada.Calendar.Time) is
      Impl : Question_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_Time (Impl.all, 5, Impl.Create_Date, Value);
   end Set_Create_Date;

   function Get_Create_Date (Object : in Question_Ref)
                  return Ada.Calendar.Time is
      Impl : constant Question_Access := Question_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Create_Date;
   end Get_Create_Date;


   procedure Set_Update_Date (Object : in out Question_Ref;
                              Value  : in ADO.Nullable_Time) is
      Impl : Question_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_Time (Impl.all, 6, Impl.Update_Date, Value);
   end Set_Update_Date;

   function Get_Update_Date (Object : in Question_Ref)
                  return ADO.Nullable_Time is
      Impl : constant Question_Access := Question_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Update_Date;
   end Get_Update_Date;


   procedure Set_Author (Object : in out Question_Ref;
                          Value : in String) is
      Impl : Question_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_String (Impl.all, 7, Impl.Author, Value);
   end Set_Author;

   procedure Set_Author (Object : in out Question_Ref;
                         Value  : in Ada.Strings.Unbounded.Unbounded_String) is
      Impl : Question_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_Unbounded_String (Impl.all, 7, Impl.Author, Value);
   end Set_Author;

   function Get_Author (Object : in Question_Ref)
                 return String is
   begin
      return Ada.Strings.Unbounded.To_String (Object.Get_Author);
   end Get_Author;
   function Get_Author (Object : in Question_Ref)
                  return Ada.Strings.Unbounded.Unbounded_String is
      Impl : constant Question_Access := Question_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Author;
   end Get_Author;

   --  Copy of the object.
   procedure Copy (Object : in Question_Ref;
                   Into   : in out Question_Ref) is
      Result : Question_Ref;
   begin
      if not Object.Is_Null then
         declare
            Impl : constant Question_Access
              := Question_Impl (Object.Get_Load_Object.all)'Access;
            Copy : constant Question_Access
              := new Question_Impl;
         begin
            ADO.Objects.Set_Object (Result, Copy.all'Access);
            Copy.Copy (Impl.all);
            Copy.Version := Impl.Version;
            Copy.Title := Impl.Title;
            Copy.Text := Impl.Text;
            Copy.Create_Date := Impl.Create_Date;
            Copy.Update_Date := Impl.Update_Date;
            Copy.Author := Impl.Author;
         end;
      end if;
      Into := Result;
   end Copy;

   procedure Find (Object  : in out Question_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean) is
      Impl  : constant Question_Access := new Question_Impl;
   begin
      Impl.Find (Session, Query, Found);
      if Found then
         ADO.Objects.Set_Object (Object, Impl.all'Access);
      else
         ADO.Objects.Set_Object (Object, null);
         Destroy (Impl);
      end if;
   end Find;

   procedure Load (Object  : in out Question_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier) is
      Impl  : constant Question_Access := new Question_Impl;
      Found : Boolean;
      Query : ADO.SQL.Query;
   begin
      Query.Bind_Param (Position => 1, Value => Id);
      Query.Set_Filter ("id = ?");
      Impl.Find (Session, Query, Found);
      if not Found then
         Destroy (Impl);
         raise ADO.Objects.NOT_FOUND;
      end if;
      ADO.Objects.Set_Object (Object, Impl.all'Access);
   end Load;

   procedure Load (Object  : in out Question_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier;
                   Found   : out Boolean) is
      Impl  : constant Question_Access := new Question_Impl;
      Query : ADO.SQL.Query;
   begin
      Query.Bind_Param (Position => 1, Value => Id);
      Query.Set_Filter ("id = ?");
      Impl.Find (Session, Query, Found);
      if not Found then
         Destroy (Impl);
      else
         ADO.Objects.Set_Object (Object, Impl.all'Access);
      end if;
   end Load;

   procedure Save (Object  : in out Question_Ref;
                   Session : in out ADO.Sessions.Master_Session'Class) is
      Impl : ADO.Objects.Object_Record_Access := Object.Get_Object;
   begin
      if Impl = null then
         Impl := new Question_Impl;
         ADO.Objects.Set_Object (Object, Impl);
      end if;
      if not ADO.Objects.Is_Created (Impl.all) then
         Impl.Create (Session);
      else
         Impl.Save (Session);
      end if;
   end Save;

   procedure Delete (Object  : in out Question_Ref;
                     Session : in out ADO.Sessions.Master_Session'Class) is
      Impl : constant ADO.Objects.Object_Record_Access := Object.Get_Object;
   begin
      if Impl /= null then
         Impl.Delete (Session);
      end if;
   end Delete;

   --  --------------------
   --  Free the object
   --  --------------------
   procedure Destroy (Object : access Question_Impl) is
      type Question_Impl_Ptr is access all Question_Impl;
      procedure Unchecked_Free is new Ada.Unchecked_Deallocation
              (Question_Impl, Question_Impl_Ptr);
      Ptr : Question_Impl_Ptr := Question_Impl (Object.all)'Access;
   begin
      Unchecked_Free (Ptr);
   end Destroy;

   procedure Find (Object  : in out Question_Impl;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean) is
      Stmt : ADO.Statements.Query_Statement
          := Session.Create_Statement (Query, QUESTION_DEF'Access);
   begin
      Stmt.Execute;
      if Stmt.Has_Elements then
         Object.Load (Stmt, Session);
         Stmt.Next;
         Found := not Stmt.Has_Elements;
      else
         Found := False;
      end if;
   end Find;

   overriding
   procedure Load (Object  : in out Question_Impl;
                   Session : in out ADO.Sessions.Session'Class) is
      Found : Boolean;
      Query : ADO.SQL.Query;
      Id    : constant ADO.Identifier := Object.Get_Key_Value;
   begin
      Query.Bind_Param (Position => 1, Value => Id);
      Query.Set_Filter ("id = ?");
      Object.Find (Session, Query, Found);
      if not Found then
         raise ADO.Objects.NOT_FOUND;
      end if;
   end Load;

   procedure Save (Object  : in out Question_Impl;
                   Session : in out ADO.Sessions.Master_Session'Class) is
      Stmt : ADO.Statements.Update_Statement
         := Session.Create_Statement (QUESTION_DEF'Access);
   begin
      if Object.Is_Modified (1) then
         Stmt.Save_Field (Name  => COL_0_1_NAME, --  id
                          Value => Object.Get_Key);
         Object.Clear_Modified (1);
      end if;
      if Object.Is_Modified (3) then
         Stmt.Save_Field (Name  => COL_2_1_NAME, --  title
                          Value => Object.Title);
         Object.Clear_Modified (3);
      end if;
      if Object.Is_Modified (4) then
         Stmt.Save_Field (Name  => COL_3_1_NAME, --  text
                          Value => Object.Text);
         Object.Clear_Modified (4);
      end if;
      if Object.Is_Modified (5) then
         Stmt.Save_Field (Name  => COL_4_1_NAME, --  create_date
                          Value => Object.Create_Date);
         Object.Clear_Modified (5);
      end if;
      if Object.Is_Modified (6) then
         Stmt.Save_Field (Name  => COL_5_1_NAME, --  update_date
                          Value => Object.Update_Date);
         Object.Clear_Modified (6);
      end if;
      if Object.Is_Modified (7) then
         Stmt.Save_Field (Name  => COL_6_1_NAME, --  author
                          Value => Object.Author);
         Object.Clear_Modified (7);
      end if;
      if Stmt.Has_Save_Fields then
         Object.Version := Object.Version + 1;
         Stmt.Save_Field (Name  => "version",
                          Value => Object.Version);
         Stmt.Set_Filter (Filter => "id = ? and version = ?");
         Stmt.Add_Param (Value => Object.Get_Key);
         Stmt.Add_Param (Value => Object.Version - 1);
         declare
            Result : Integer;
         begin
            Stmt.Execute (Result);
            if Result /= 1 then
               if Result /= 0 then
                  raise ADO.Objects.UPDATE_ERROR;
               else
                  raise ADO.Objects.LAZY_LOCK;
               end if;
            end if;
         end;
      end if;
   end Save;

   procedure Create (Object  : in out Question_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class) is
      Query : ADO.Statements.Insert_Statement
                  := Session.Create_Statement (QUESTION_DEF'Access);
      Result : Integer;
   begin
      Object.Version := 1;
      Session.Allocate (Id => Object);
      Query.Save_Field (Name  => COL_0_1_NAME, --  id
                        Value => Object.Get_Key);
      Query.Save_Field (Name  => COL_1_1_NAME, --  version
                        Value => Object.Version);
      Query.Save_Field (Name  => COL_2_1_NAME, --  title
                        Value => Object.Title);
      Query.Save_Field (Name  => COL_3_1_NAME, --  text
                        Value => Object.Text);
      Query.Save_Field (Name  => COL_4_1_NAME, --  create_date
                        Value => Object.Create_Date);
      Query.Save_Field (Name  => COL_5_1_NAME, --  update_date
                        Value => Object.Update_Date);
      Query.Save_Field (Name  => COL_6_1_NAME, --  author
                        Value => Object.Author);
      Query.Execute (Result);
      if Result /= 1 then
         raise ADO.Objects.INSERT_ERROR;
      end if;
      ADO.Objects.Set_Created (Object);
   end Create;

   procedure Delete (Object  : in out Question_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class) is
      Stmt : ADO.Statements.Delete_Statement
         := Session.Create_Statement (QUESTION_DEF'Access);
   begin
      Stmt.Set_Filter (Filter => "id = ?");
      Stmt.Add_Param (Value => Object.Get_Key);
      Stmt.Execute;
   end Delete;

   function Get_Value (From : in Question_Ref;
                       Name : in String) return Util.Beans.Objects.Object is
      Obj  : constant ADO.Objects.Object_Record_Access := From.Get_Load_Object;
      Impl : access Question_Impl;
   begin
      if Obj = null then
         return Util.Beans.Objects.Null_Object;
      end if;
      Impl := Question_Impl (Obj.all)'Access;
      if Name = "id" then
         return ADO.Objects.To_Object (Impl.Get_Key);
      elsif Name = "title" then
         return Util.Beans.Objects.To_Object (Impl.Title);
      elsif Name = "text" then
         return Util.Beans.Objects.To_Object (Impl.Text);
      elsif Name = "create_date" then
         return Util.Beans.Objects.Time.To_Object (Impl.Create_Date);
      elsif Name = "update_date" then
         if Impl.Update_Date.Is_Null then
            return Util.Beans.Objects.Null_Object;
         else
            return Util.Beans.Objects.Time.To_Object (Impl.Update_Date.Value);
         end if;
      elsif Name = "author" then
         return Util.Beans.Objects.To_Object (Impl.Author);
      end if;
      return Util.Beans.Objects.Null_Object;
   end Get_Value;



   procedure List (Object  : in out Question_Vector;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class) is
      Stmt : ADO.Statements.Query_Statement
        := Session.Create_Statement (Query, QUESTION_DEF'Access);
   begin
      Stmt.Execute;
      Question_Vectors.Clear (Object);
      while Stmt.Has_Elements loop
         declare
            Item : Question_Ref;
            Impl : constant Question_Access := new Question_Impl;
         begin
            Impl.Load (Stmt, Session);
            ADO.Objects.Set_Object (Item, Impl.all'Access);
            Object.Append (Item);
         end;
         Stmt.Next;
      end loop;
   end List;

   --  ------------------------------
   --  Load the object from current iterator position
   --  ------------------------------
   procedure Load (Object  : in out Question_Impl;
                   Stmt    : in out ADO.Statements.Query_Statement'Class;
                   Session : in out ADO.Sessions.Session'Class) is
      pragma Unreferenced (Session);
   begin
      Object.Set_Key_Value (Stmt.Get_Identifier (0));
      Object.Title := Stmt.Get_Unbounded_String (2);
      Object.Text := Stmt.Get_Unbounded_String (3);
      Object.Create_Date := Stmt.Get_Time (4);
      Object.Update_Date := Stmt.Get_Time (5);
      Object.Author := Stmt.Get_Unbounded_String (6);
      Object.Version := Stmt.Get_Integer (1);
      ADO.Objects.Set_Created (Object);
   end Load;
   function Answer_Key (Id : in ADO.Identifier) return ADO.Objects.Object_Key is
      Result : ADO.Objects.Object_Key (Of_Type  => ADO.Objects.KEY_INTEGER,
                                       Of_Class => ANSWER_DEF'Access);
   begin
      ADO.Objects.Set_Value (Result, Id);
      return Result;
   end Answer_Key;

   function Answer_Key (Id : in String) return ADO.Objects.Object_Key is
      Result : ADO.Objects.Object_Key (Of_Type  => ADO.Objects.KEY_INTEGER,
                                       Of_Class => ANSWER_DEF'Access);
   begin
      ADO.Objects.Set_Value (Result, Id);
      return Result;
   end Answer_Key;

   function "=" (Left, Right : Answer_Ref'Class) return Boolean is
   begin
      return ADO.Objects.Object_Ref'Class (Left) = ADO.Objects.Object_Ref'Class (Right);
   end "=";

   procedure Set_Field (Object : in out Answer_Ref'Class;
                        Impl   : out Answer_Access) is
      Result : ADO.Objects.Object_Record_Access;
   begin
      Object.Prepare_Modify (Result);
      Impl := Answer_Impl (Result.all)'Access;
   end Set_Field;

   --  Internal method to allocate the Object_Record instance
   procedure Allocate (Object : in out Answer_Ref) is
      Impl : Answer_Access;
   begin
      Impl := new Answer_Impl;
      Impl.Version := 0;
      ADO.Objects.Set_Object (Object, Impl.all'Access);
   end Allocate;

   -- ----------------------------------------
   --  Data object: Answer
   -- ----------------------------------------

   procedure Set_Id (Object : in out Answer_Ref;
                     Value  : in ADO.Identifier) is
      Impl : Answer_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_Key_Value (Impl.all, 1, Value);
   end Set_Id;

   function Get_Id (Object : in Answer_Ref)
                  return ADO.Identifier is
      Impl : constant Answer_Access := Answer_Impl (Object.Get_Object.all)'Access;
   begin
      return Impl.Get_Key_Value;
   end Get_Id;


   function Get_Version (Object : in Answer_Ref)
                  return Integer is
      Impl : constant Answer_Access := Answer_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Version;
   end Get_Version;


   procedure Set_Text (Object : in out Answer_Ref;
                        Value : in String) is
      Impl : Answer_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_String (Impl.all, 3, Impl.Text, Value);
   end Set_Text;

   procedure Set_Text (Object : in out Answer_Ref;
                       Value  : in Ada.Strings.Unbounded.Unbounded_String) is
      Impl : Answer_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_Unbounded_String (Impl.all, 3, Impl.Text, Value);
   end Set_Text;

   function Get_Text (Object : in Answer_Ref)
                 return String is
   begin
      return Ada.Strings.Unbounded.To_String (Object.Get_Text);
   end Get_Text;
   function Get_Text (Object : in Answer_Ref)
                  return Ada.Strings.Unbounded.Unbounded_String is
      Impl : constant Answer_Access := Answer_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Text;
   end Get_Text;


   procedure Set_Author (Object : in out Answer_Ref;
                          Value : in String) is
      Impl : Answer_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_String (Impl.all, 4, Impl.Author, Value);
   end Set_Author;

   procedure Set_Author (Object : in out Answer_Ref;
                         Value  : in Ada.Strings.Unbounded.Unbounded_String) is
      Impl : Answer_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_Unbounded_String (Impl.all, 4, Impl.Author, Value);
   end Set_Author;

   function Get_Author (Object : in Answer_Ref)
                 return String is
   begin
      return Ada.Strings.Unbounded.To_String (Object.Get_Author);
   end Get_Author;
   function Get_Author (Object : in Answer_Ref)
                  return Ada.Strings.Unbounded.Unbounded_String is
      Impl : constant Answer_Access := Answer_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Author;
   end Get_Author;


   procedure Set_Question (Object : in out Answer_Ref;
                           Value  : in demo.Models.Question_Ref'Class) is
      Impl : Answer_Access;
   begin
      Set_Field (Object, Impl);
      ADO.Objects.Set_Field_Object (Impl.all, 5, Impl.Question, Value);
   end Set_Question;

   function Get_Question (Object : in Answer_Ref)
                  return demo.Models.Question_Ref'Class is
      Impl : constant Answer_Access := Answer_Impl (Object.Get_Load_Object.all)'Access;
   begin
      return Impl.Question;
   end Get_Question;

   --  Copy of the object.
   procedure Copy (Object : in Answer_Ref;
                   Into   : in out Answer_Ref) is
      Result : Answer_Ref;
   begin
      if not Object.Is_Null then
         declare
            Impl : constant Answer_Access
              := Answer_Impl (Object.Get_Load_Object.all)'Access;
            Copy : constant Answer_Access
              := new Answer_Impl;
         begin
            ADO.Objects.Set_Object (Result, Copy.all'Access);
            Copy.Copy (Impl.all);
            Copy.Version := Impl.Version;
            Copy.Text := Impl.Text;
            Copy.Author := Impl.Author;
            Copy.Question := Impl.Question;
         end;
      end if;
      Into := Result;
   end Copy;

   procedure Find (Object  : in out Answer_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean) is
      Impl  : constant Answer_Access := new Answer_Impl;
   begin
      Impl.Find (Session, Query, Found);
      if Found then
         ADO.Objects.Set_Object (Object, Impl.all'Access);
      else
         ADO.Objects.Set_Object (Object, null);
         Destroy (Impl);
      end if;
   end Find;

   procedure Load (Object  : in out Answer_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier) is
      Impl  : constant Answer_Access := new Answer_Impl;
      Found : Boolean;
      Query : ADO.SQL.Query;
   begin
      Query.Bind_Param (Position => 1, Value => Id);
      Query.Set_Filter ("id = ?");
      Impl.Find (Session, Query, Found);
      if not Found then
         Destroy (Impl);
         raise ADO.Objects.NOT_FOUND;
      end if;
      ADO.Objects.Set_Object (Object, Impl.all'Access);
   end Load;

   procedure Load (Object  : in out Answer_Ref;
                   Session : in out ADO.Sessions.Session'Class;
                   Id      : in ADO.Identifier;
                   Found   : out Boolean) is
      Impl  : constant Answer_Access := new Answer_Impl;
      Query : ADO.SQL.Query;
   begin
      Query.Bind_Param (Position => 1, Value => Id);
      Query.Set_Filter ("id = ?");
      Impl.Find (Session, Query, Found);
      if not Found then
         Destroy (Impl);
      else
         ADO.Objects.Set_Object (Object, Impl.all'Access);
      end if;
   end Load;

   procedure Save (Object  : in out Answer_Ref;
                   Session : in out ADO.Sessions.Master_Session'Class) is
      Impl : ADO.Objects.Object_Record_Access := Object.Get_Object;
   begin
      if Impl = null then
         Impl := new Answer_Impl;
         ADO.Objects.Set_Object (Object, Impl);
      end if;
      if not ADO.Objects.Is_Created (Impl.all) then
         Impl.Create (Session);
      else
         Impl.Save (Session);
      end if;
   end Save;

   procedure Delete (Object  : in out Answer_Ref;
                     Session : in out ADO.Sessions.Master_Session'Class) is
      Impl : constant ADO.Objects.Object_Record_Access := Object.Get_Object;
   begin
      if Impl /= null then
         Impl.Delete (Session);
      end if;
   end Delete;

   --  --------------------
   --  Free the object
   --  --------------------
   procedure Destroy (Object : access Answer_Impl) is
      type Answer_Impl_Ptr is access all Answer_Impl;
      procedure Unchecked_Free is new Ada.Unchecked_Deallocation
              (Answer_Impl, Answer_Impl_Ptr);
      Ptr : Answer_Impl_Ptr := Answer_Impl (Object.all)'Access;
   begin
      Unchecked_Free (Ptr);
   end Destroy;

   procedure Find (Object  : in out Answer_Impl;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class;
                   Found   : out Boolean) is
      Stmt : ADO.Statements.Query_Statement
          := Session.Create_Statement (Query, ANSWER_DEF'Access);
   begin
      Stmt.Execute;
      if Stmt.Has_Elements then
         Object.Load (Stmt, Session);
         Stmt.Next;
         Found := not Stmt.Has_Elements;
      else
         Found := False;
      end if;
   end Find;

   overriding
   procedure Load (Object  : in out Answer_Impl;
                   Session : in out ADO.Sessions.Session'Class) is
      Found : Boolean;
      Query : ADO.SQL.Query;
      Id    : constant ADO.Identifier := Object.Get_Key_Value;
   begin
      Query.Bind_Param (Position => 1, Value => Id);
      Query.Set_Filter ("id = ?");
      Object.Find (Session, Query, Found);
      if not Found then
         raise ADO.Objects.NOT_FOUND;
      end if;
   end Load;

   procedure Save (Object  : in out Answer_Impl;
                   Session : in out ADO.Sessions.Master_Session'Class) is
      Stmt : ADO.Statements.Update_Statement
         := Session.Create_Statement (ANSWER_DEF'Access);
   begin
      if Object.Is_Modified (1) then
         Stmt.Save_Field (Name  => COL_0_2_NAME, --  id
                          Value => Object.Get_Key);
         Object.Clear_Modified (1);
      end if;
      if Object.Is_Modified (3) then
         Stmt.Save_Field (Name  => COL_2_2_NAME, --  text
                          Value => Object.Text);
         Object.Clear_Modified (3);
      end if;
      if Object.Is_Modified (4) then
         Stmt.Save_Field (Name  => COL_3_2_NAME, --  author
                          Value => Object.Author);
         Object.Clear_Modified (4);
      end if;
      if Object.Is_Modified (5) then
         Stmt.Save_Field (Name  => COL_4_2_NAME, --  question_id
                          Value => Object.Question);
         Object.Clear_Modified (5);
      end if;
      if Stmt.Has_Save_Fields then
         Object.Version := Object.Version + 1;
         Stmt.Save_Field (Name  => "version",
                          Value => Object.Version);
         Stmt.Set_Filter (Filter => "id = ? and version = ?");
         Stmt.Add_Param (Value => Object.Get_Key);
         Stmt.Add_Param (Value => Object.Version - 1);
         declare
            Result : Integer;
         begin
            Stmt.Execute (Result);
            if Result /= 1 then
               if Result /= 0 then
                  raise ADO.Objects.UPDATE_ERROR;
               else
                  raise ADO.Objects.LAZY_LOCK;
               end if;
            end if;
         end;
      end if;
   end Save;

   procedure Create (Object  : in out Answer_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class) is
      Query : ADO.Statements.Insert_Statement
                  := Session.Create_Statement (ANSWER_DEF'Access);
      Result : Integer;
   begin
      Object.Version := 1;
      Session.Allocate (Id => Object);
      Query.Save_Field (Name  => COL_0_2_NAME, --  id
                        Value => Object.Get_Key);
      Query.Save_Field (Name  => COL_1_2_NAME, --  version
                        Value => Object.Version);
      Query.Save_Field (Name  => COL_2_2_NAME, --  text
                        Value => Object.Text);
      Query.Save_Field (Name  => COL_3_2_NAME, --  author
                        Value => Object.Author);
      Query.Save_Field (Name  => COL_4_2_NAME, --  question_id
                        Value => Object.Question);
      Query.Execute (Result);
      if Result /= 1 then
         raise ADO.Objects.INSERT_ERROR;
      end if;
      ADO.Objects.Set_Created (Object);
   end Create;

   procedure Delete (Object  : in out Answer_Impl;
                     Session : in out ADO.Sessions.Master_Session'Class) is
      Stmt : ADO.Statements.Delete_Statement
         := Session.Create_Statement (ANSWER_DEF'Access);
   begin
      Stmt.Set_Filter (Filter => "id = ?");
      Stmt.Add_Param (Value => Object.Get_Key);
      Stmt.Execute;
   end Delete;

   function Get_Value (From : in Answer_Ref;
                       Name : in String) return Util.Beans.Objects.Object is
      Obj  : constant ADO.Objects.Object_Record_Access := From.Get_Load_Object;
      Impl : access Answer_Impl;
   begin
      if Obj = null then
         return Util.Beans.Objects.Null_Object;
      end if;
      Impl := Answer_Impl (Obj.all)'Access;
      if Name = "id" then
         return ADO.Objects.To_Object (Impl.Get_Key);
      elsif Name = "text" then
         return Util.Beans.Objects.To_Object (Impl.Text);
      elsif Name = "author" then
         return Util.Beans.Objects.To_Object (Impl.Author);
      end if;
      return Util.Beans.Objects.Null_Object;
   end Get_Value;



   procedure List (Object  : in out Answer_Vector;
                   Session : in out ADO.Sessions.Session'Class;
                   Query   : in ADO.SQL.Query'Class) is
      Stmt : ADO.Statements.Query_Statement
        := Session.Create_Statement (Query, ANSWER_DEF'Access);
   begin
      Stmt.Execute;
      Answer_Vectors.Clear (Object);
      while Stmt.Has_Elements loop
         declare
            Item : Answer_Ref;
            Impl : constant Answer_Access := new Answer_Impl;
         begin
            Impl.Load (Stmt, Session);
            ADO.Objects.Set_Object (Item, Impl.all'Access);
            Object.Append (Item);
         end;
         Stmt.Next;
      end loop;
   end List;

   --  ------------------------------
   --  Load the object from current iterator position
   --  ------------------------------
   procedure Load (Object  : in out Answer_Impl;
                   Stmt    : in out ADO.Statements.Query_Statement'Class;
                   Session : in out ADO.Sessions.Session'Class) is
   begin
      Object.Set_Key_Value (Stmt.Get_Identifier (0));
      Object.Text := Stmt.Get_Unbounded_String (2);
      Object.Author := Stmt.Get_Unbounded_String (3);
      if not Stmt.Is_Null (4) then
         Object.Question.Set_Key_Value (Stmt.Get_Identifier (4), Session);
      end if;
      Object.Version := Stmt.Get_Integer (1);
      ADO.Objects.Set_Created (Object);
   end Load;


end demo.Models;
