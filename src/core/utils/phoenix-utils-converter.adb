package body Phoenix.Utils.Converter is

   function To_Natural (Item : String) return Natural is
   begin
      return Natural'Value (Item);
   end To_Natural;

   function To_Positive (Item : String) return Positive is
   begin
      return Positive'Value (Item);
   end To_Positive;

   function To_Boolean (Item : String) return Boolean is
   begin
        return Boolean'Value (Item);
   end To_Boolean;

   function To_Duration (Item : String) return Duration is
   begin
      return Duration'Value (Item);
   end To_Duration;


end Phoenix.Utils.Converter;


