with Phoenix;
with Phoenix.Utils;

package Phoenix.Utils.Converter is

   function To_Natural (Item : String) return Natural;

   function To_Positive (Item : String) return Positive;

   function To_Boolean (Item : String) return Boolean;

   function To_Duration (Item : String) return Duration;

end Phoenix.Utils.Converter;
