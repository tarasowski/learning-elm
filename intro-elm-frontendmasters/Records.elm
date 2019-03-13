-- Records
{-
   * You cannot iterate over Records in Elm
   * Records are plain data holding structures
   * There is no `this` or `prototype` on Records
   * Records can contain different data types, while
    * Lists can only contain `a` data type
    * You can iterate over Lists

-}


module Main exposing (foo, newFoo)

-- Records


foo =
    { bar = "baz", x = 5 }



-- Record Updates - give me the old record and create a new copy with updated values


newFoo =
    { foo | x = 42 }



--- Booleans


b =
    not (foo || bar) && True
