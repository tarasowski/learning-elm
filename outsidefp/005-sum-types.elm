-- Sum Types
{-
         * (Maybe a) is a sum type with a type variable. But sum types don't have to use type variables. Bool is a simpler sum type with two values:
         type Bool = True | False
         case 3 < 9 of
           True -> "true"
           False -> "false"

      * Pattern matching or case expression of is the same as. It removes the boilerplate or nested if else statements.
        if 3 < 9
        then Just "true"
        else Nothing

     * In other languages it's allowed to skip else just to use if. In JS functions can return nothing or return null. In Elm this is not allowed. Because functions map arguments of one type to results of another type.

     if arg < 0 then
       negate arg
       else if arg == 0 then
         -1
         else
           arg

     type Order = LT | EQ | GT

     case compare arg 0 of
       LT -> negate arg
       EQ -> -1
       GT -> arg


   * Catch-all matcher `_`

   case compare arg 0 of
     LT -> 0
     EQ -> 0
     GT -> arg

   case compare arg 0 of
     GT -> arg
     _  -> 0
-}
-- Constructing a New Sum Type
{-
         type Silly a b
           = AsA a
           | AsB b
           | AlsoAsA a
           | AsInt Int
           | AsFloatString Float String
           | AsBoth a b
           | AsIntB Int b
           | AsMaybe (Maybe b)
           | AsMaybeInt (Maybe Int)
           | DeeplySilly (Silly a a) (Silly Int b)
           | NoArg

         * Whereas Maybe only has one type variable. Silly has two. A sum type can have as many as you like.
         * Silly creates a new name in the module that contains it. That name isn't "real" in the sense of being something your code can compute with. It's only for use in type annotations, like these:

         becomeSilly1 : Int -> b -> Silly Int b
         becomeSilly2 : a -> Int -> Silly a Int
         becomeSilly3 : Int -> Bool -> Silly Int Bool
         becomeSilly4 : a -> b -> Silly a b

         * After a type comes a list of value constructors. The first 4 are riminiscent of Just's declaration in Maybe:
         type Silly a b
           = AsA a
           | AsB b
           | AlsoAsA a

         type Maybe a
           = Just a
           | Nothing

      * VALUE CONSTRUCTORS are functions just like any other function (except for starting with capital letter)
      > AsA
      <function> : a -> Silly a b

      * You can do with a constructor anything you want. Passing it into into another function

      > List.map Just [1.1, 2.2]
      [(Just 1.1), (Just 2.2)] : List Maybe.Maybe Float
      > List.map AsA [1.1, 2.2]
      [(AsA 1.1), (AsA 2.2)] : List (Silly Float b)

   * Notice: using List.map with Just produces a value of type (Maybe Float), where as using AsA produces (Silly Float b).
     That's because the AsA constructor's line only mentions (a). The compiler knows that, so the result type has only one type variable "concretized". You could pass the result AsA 1.1 to functions like these:

     f : Silly Float anyType -> Int
     f : Silly type1 type2 -> Int
-}
-- Type vs. Type Alias
{-
    * `type` is used for defining new union types aka sum types (types that consists of multiple types that cannot be mixed):
    > type Thing = Something | SomethingElse
    * Before this definition Something and SomethingElse didn't mean anything. Now they are both of type Thing, which we just defined.

    * `type alias` is used for giving a name to some other type that already exists:
    > type alias Location = { lat:Int, long:Int }
    * { lat = 5, long = 10 } has type { lat:Int, long:Int }, which was already a valid type. But now we can also say it has type Location because that is an alias for the same type.

   * The key is the word alias. In the course of programming, when you want to group things that belong together, you put it in a record, like in the case of a point: { x = 5, y = 4 }
   * Now, if you needed to pass these records around, you'd have to spell out the entire type, like:
   > add : { x:Int, y:Int } -> { x:Int, y:Int } -> { x:Int, y:Int }
   > add a b =
     { a.x + b.x, a.y + b.y }
   * If you could alias a point, the signature would be so much easier to write!
   > type alias Point = { x:Int, y:Int }
   > add : Point -> Point -> Point
   > add a b =
   > { a.x + b.x, a.y + b.y }

-}


module Main exposing (..)
