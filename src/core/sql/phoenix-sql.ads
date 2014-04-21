--with Ada.Exceptions;

with ADO;
with ADO.SQL;
with ADO.Objects;
with ADO.Drivers;
with ADO.Sessions;
with ADO.Sessions.Factory;
with ADO.Statements;
with Ada.Calendar;

--with Demo.Models;

with Phoenix;

package Phoenix.SQL is

   Factory  : ADO.Sessions.Factory.Session_Factory;
   DB       : ADO.Sessions.Master_Session;
   --Question : Demo.Models.Question_Ref;
   --Answer   : Demo.Models.Answer_Ref;

   procedure Connect;

end Phoenix.SQL;
