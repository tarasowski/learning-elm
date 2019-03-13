-- Types
-- Types are names that used to lump together similar values
-- A type is a collection of related values
-- A type is a set of values (sets in cs have the same type)

-- Concrete Types
-- Concrete types begin with capital letter -> Int, Bool, Float, Char, String, Regex, Date, Color
-- Concret types are any type without type variables such as a,a1,b etc.
{-
   > "foo"
   > "foo" : String
   First the value than type!

   > Color.red
   > RGBA 204 0 0 1 : Color.Color
   Color meand the Color type in the module Color
-}
-- Function Types
-- Function types can be composed of concrete types.
{-
   > fnord
   <function> : String -> String
   First the value <function> : then the type String -> String (takes a String and returns a String)

   > String.repeat
   <function> : Int -> String -> String
   First the value <function> : First argument Int, second argument String and result is a String

   Case for partial application
   > repeat3 = String.repeat 3
   > repeat3
   <function> : String -> String
   > repeat3 "abc"
   "abcabcabc" : String
-}
-- Quantified Types (Abstract Types)
-- Quantified types are types with type variables. They can also be called abstract types
-- It is a type variable that distinguish such type from concrete types.
{-
   > [1.0, 2.0, 3.0]
   [1,2,3] : List Float

   > ["a", "b", "c"]
   ["a", "b", "c"] : List String

   > List.length
   <function> : List a -> Int
   First the value <function>: than the types List a -> Int

   * The lower case a is a type variable. It marks a type where the type must be present , but it doesnt say anything about what type that should be.

   > List.append
   <function> : List a -> List a -> List a

   > List.append [1,3,4] [5,6,7]
   [1,3,4,5,6,7] : List Int

   > List.append [1,2,3] ["a","b","c"]
   -- Type mismatch
   The 2nd argument to function append is causing mismatch

   * The compiler knows three things about append function:
   1) Its first argument can be any type of list
   2) The second argument must be the same type of list
   3) And so will be the return type

   > length2 [1,2,3] ["a","b","c"]
   > 6 : Int
   > length2 list1 list2 = List.length list1 + List.length list2
   > <function>: List a -> List a1 -> Int

   * Elm indicates that the two lists may be of different type by using different type variable. a and a1
   * If we fix the first argument, the second argument can be of any type
   > length2 [1]
   > <function> : List a -> Int
-}
-- Reserved Type Variabls
-- Elm has three special type variables: number, comparable, and appendable.
{-

   * If you see something like below, you should know you that's different than declarations that use type variables like `a` `result` or `firstArgType`. You have encountered a special case.

   negate : number -> number
   > (>)
   max : comparable -> comparable -> comparable
   > (++)
   <function> : appendable -> appendable -> appendable

   -- number
   * We have number as a special type because usually if you want to add Int + Float it' doesn't work with a regular function
   > addInt : Int -> Int -> Int
   > addFloat : Float -> Float -> Float

   Therefore we have:
   (+) : number -> number -> number
   * It's a function that works on both Int and Float

   -- comparable
   * Solves a similar problem. We want to work (>) with both Int and Float. It works also with lists, provided the elements are of the same type.
   >[1,2,3] > [1,2,3]
   True : Bool

   -- appendable
   * Works on both strings and lists
   > "abc" ++ "cdf"
   > "abccdf"
   > ["a", "b"] ++ ["c", "d"]
   > ["a", "b", "c", "d"]
-}
-- Higher Order Function
-- Functions that take other functions as arguments or return other functions
{-
   * When function take functions as arguments, the type of the function argument is surrounded with parentheses
   > List.map
   <function> : (a -> b) -> List a -> List b
   * The type shows that the first paramter must be another function. It takes `a` and produces `b`
   * Map feeds the second argument to its first - the second paramter type has to be `a`. Similarly the type varible in the return type must be `b`.

   * Partial application can force other types to become more specific.
   > List.map String.length
   <function> : List String -> List Int
   > List.map String.toUpper
   <function> : List String -> List String
-}


module Main exposing (..)
