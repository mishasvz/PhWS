package body Phoenix is

   function CommandLine(Pos : Natural) return String is
      Command : Ada.Strings.Unbounded.Unbounded_String;
      Length  : Natural;
   begin
      Command := Ada.Strings.Unbounded.To_Unbounded_String(Ada.Command_Line.Argument(Pos));
      Length  := Ada.Strings.Unbounded.Length(Command);
      return Ada.Strings.Unbounded.To_String(Ada.Strings.Unbounded.Unbounded_Slice(Command, 4, Length));
   end CommandLine;

end Phoenix;
