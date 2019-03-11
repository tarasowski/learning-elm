-- Immutability
-- In funcitonal programming you don't change data. Instead, you create changed copies.
-- The author thinks that immutability is less life-chaning than partial application or sum types
{-
   * Building lists
   > []
   [] : List a
   * Note: Because there are no elements, the type variable can't be assigned a concrete type, so it's left alone.
   * that means we can add anything we want to the empty list. There is an operator for that (::)
   > first = "first" :: []
   ["first"] : List String
   * Now we have a list of strings and we can only add new Strings to it. Anything other will produce an error.
   > 3.5 :: first
   * Produces type mistmatch

   > "second" :: ["first"]
   ["second", "first"]
   * (::) is pronounced as "cons".

   > zero = []
   [] : List a
   > one = 1.1 :: zero
   [1.1] : List Float
   > two = 2.2 :: one
   [2.2, 1.1] : List Float
   * Conceptually, every one of the :: operations created an entirely new list. List aren't special. There is no function in Elm that modifies data (or mutates).

   * Immutability is a huge benefit when it comes to multithread programming.
-}
-- Pure functions
{-
   1) Whenever you apply a function to the same arguments, you get the same results. Function like Date.now(), Http.get etc. aren't pure.
   2) The function can make no observable  change to any state. Functiont that does not change global variables or produces effects such as writing to stdout, saving stuff in the database, triggering some other stuff outside of the function.
-}
-- Referential transparency
{-
   * It means you can always substitute the value of an expression for the expression itself. Pure functions are always referentially transparent. What that means is that, anywhere you see this function application:
   negate 3
   ...you can replace it with -3

   double x = x + x (shorthand for anonymous function)
   double = \x -> x + x (this is the same as double x = x + x)

   * Referential trasparency means that:
   (double 3) + (double 2)
   ...must produce the same value as
   ((\x -> x + x)3) + ((\x -> x + x)2)
   * Applying the first function means substituting 3 for x in (x + x). The same thing is done with 2.
   So the previous expression must have the same value as this:
   (3 + 3) + (2 + 2)
   ...the same value as
   6 + 4
   ...and this:
   10
-}


module Main exposing (..)
