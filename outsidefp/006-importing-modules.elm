-- Importing modules
{-
   * It's very common for a module to be organized around sum type with the same name
   > Maybe.Maybe a

   * An another example would be
   > import Sumtypes.Direction as Direction exposing (Direction(..))
   * If we do import it in that way we can use functions like this:
   > Direction.flip, Direction.length
   * Without the previous import statement we need to write out the full path: Sumtypes.Direction.flip, Sumtypes.Direction.length

   * If we would only import like this:
   > import Sumtypes.Direction as Direction exposing (..)
   * We wouldn't be able to use value constructors, therefore by adding (Direction(..)) gives use the possibility to have a clear syntax and usage of value constructors

   *If you do something like this:
   > import Symtype.Direction exposing (..)
   * You can run into conflicts because e.g. imported flip function would conflict with the built-in flip from the Basics module

-}
-- Pattern matching
{-
   * It's possible to have for a sum type only one value constructor
   > type Wrapper a = Wrapper a
   * For a vlaue constructor it's totally fine to have the same name as a type. Since they're used in different places.
   * `type Name` is used in type annotations and value constructor is used in code

-}


module Main exposing (..)
