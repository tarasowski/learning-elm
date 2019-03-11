-- Maybe
-- A Maybe is a sum type. It's a type that represents two or more different kinds of values that cannot be mixed.
-- Another example is String + Nothing
-- It's called sum type because the number of elements of a type like Maybe Float is the sum of the number of possible floating values (a large but finite number) plus one (the single value Nothing).
-- Elm und Idris programmers tend to use the term union type instead.
{-
       * What happens if you want to retrieve the first element of an empty list []
       > List.head []
       Nothing : Maybe.Maybe a
       * In general use, nil (a contraction of Latin "nihil") means "nothing" or the absence of something. Sometimes nil is used to mean the number zero (0). In programming, nil refers to an empty set or a list containing no entries. In some usages, nil is interchangeable with null.
       * Note: in many languages there is a simple solution return null or nil
       * The type definition for such as construct as null would look like following
       type String =
         TrueString
         | Null

        "|" means here "or".

        * So instead of returning a Null, in FP there is concept of Maybe
        type Maybe a ... --> You can create Maybe String, a Maybe Bool, a Maybe Float

        * There's an explicit representation for a value that could have been null. For String that representation is this:
        Just "string result"
        * The other possiblity (no actual value = actual value is Just "string result") is typically named:
        Nothing
      type Maybe a =
        Just a
        | Nothing

   > List.head
   <function> : List a -> Maybe.Maybe a
   * Important: The type (Maybe a) is defined in the module Maybe

   > List.head ["Darwin"]
   Just "Darwin" : Maybe.Maybe String
   > List.head []
   Nothing : Maybe.Maybe a
-}
-- Pattern matching
{-
    > String.length (List.head ["Darwin"]
    * Produces this: Function String.length expects a string but gets a type Maybe.Maybe a
    Before you can work wih List.head ["Darwin"] you need to unwrap it from the Maybe Type:
    case List.head ["Darwin"] of
      Just name ->
        String.length name
     * The case expression is an example of pattern matching:
     Just "Darwin" -- Value of List.head ["Darwin"]
     Just name -- pattern

   * The match succeeds. Because it does, the variable `name` becomes bound to the unwrapped value "Darwin".
   * **Important** That variable can be used for computation in code after the case's -> (but not outside it).
-}
-- Maybe.map and pipelines
{-
    * The string module has many functions that operate on strings: isEmpty, length, reverse, append, split.
    * In order to make those functions to operate on Maybe values, we need to lift those functions.
    * You are lifting a function that operates in a simple universe into a corresponding function for a more complicated universe (in this case with a additional value called Nothing)
    * The name of that function is Maybe.map

    > Maybe.map String.reverse Nothing
    Nothing: Maybe.Maybe String

    > Maybe.map String.reverse (Just "hello")
    Just "olleh" : Maybe.Maybe String

    * Maybe.map's behavior with Nothing means that you can pipeline functions together without any of them having to worry about  the Nothing value.
   > Nothing
       |> Maybe.map String.reverse
       |> Maybe.map (String.append "Darwin")
   Nothing: Maybe.Maybe String

   > Just "Darwin"
      |> Maybe.map String.reverse
      |> Maybe.map (String.append "Darwin")
    Just "DarwinDarwin" : Maybe.Maybe String

    > Just "Darwin" |> Maybe.map String.uncons
    Just (Just ('D', "arwin")) : Maybe.Maybe (Maybe.Maybe (Char, String))

    1) Maybe.map extracts the value "Darwin" and gives it to String.uncons
    2) Since "Darwin" isn't empty, String.uncons produces Just ('D', "arwin")
    3) Per it's definition, Maybe.map wraps the result in another Just
-}
-- Maybe.andThen
-- Avoiding double wrapping with a function andThen (.chain or .bind)
{-
      map : (a -> b) -> Maybe a -> Maybe b
      andThen : (a -> Maybe b) -> Maybe a -> Maybe b

      map f maybe =
       case maybe of
         Nothing -> Nothing
         Just a -> Just (f a)

      andThen f maybe =
        case maybe of
          Nothing -> Nothing
          Just a -> f a

      headButLast : List String -> Maybe String
      headButLast list =
        list                              -- ["Darwin"]
          |> List.head                    -- Just "Darwin"
          |> Maybe.map String.reverse     -- Just "niwraD"
          |> Maybe.andThen String.uncons  -- Just ('n', "iwraD")
          |> Maybe.map Tuple.second       -- Just "iwraD"
          |> Maybe.map String.reverse     -- Just "Darwi"

   1) If List.head produces Nothing, all the following Maybe.map and Maybe.andThen lines will just forward Nothing. Making the final result Nothing.
   2) Otherwise, if the original list was [""] List.uncons will produce Nothing. And that means the following use of .map won't acutally apply their function arguments but rather just forward Nothing on.

-}
-- Unwrapping the value from Maybe
{-
      > Maybe.withDefault 0 (Just 4)
      4 : Int

      > Maybe.withDefault
      <function> : a -> Maybe.Maybe a -> a

      Just 3 : Maybe.Maybe Int
      > ["Darwin"] |> List.head |> Maybe.map String.length |> Maybe.withDefault 0
      6 : Int

      > [] |> List.head |> Maybe.map String.length |> Maybe.withDefault 0
      0 : Int
   * Another example from the Elm Architecture
   model
     |> addSomethingTo     -- changes the model
     |> changeSomethingIn  -- changes the model
     |> trySomethingThatMightFail -- produces a Maybe model
     |> Maybe.map continueWorking  -- changes the wrapped model
     |> Maybe.withDefault model -- extracts the wrapped model, or no change
-}
-- Laws
{-
       * In functional programming, sanity perserving rules like below are called LAWS.

      * Functor Laws
       1) map f (Just 3) should be able to change the value of 3 to produce something like (Just "three"), but it should be able to produce Nothing. And mapping a function over a list should not produce a list of different size --> Identity law
       2) map should act sanely around function composition --> Composition law

       > ["1", "bar"] |> List.map String.reverse |> List.map String.toUpper
       is the same as
       > ["1", "bar"] |> List.map (String.reverse >> String.toUpper)

   > String.map
   <function> : (Char -> Char) -> String -> String
   > List.map
   <function> : (a -> b) -> List a -> List b
   > Maybe.map
   <function> : (a -> b) -> Maybe a -> Maybe b

   > split = List.map String.uncons ["a", "bad", "", "moon"]
   [Just ('a', ""), Just ('b', "ad"), Nothing, Just ('m', "oon")]
   > almost = List.map (Maybe.map Tuple.first) split
   [Just 'a', Just 'b', Nothing, Just 'm']
   import Maybe.Extra as Maybe
   > Maybe.values almost
   ['a', 'b', 'm'] : List Char

   ["a", "bad", "", "moon"]
    |> List.map String.uncons
    |> List.map (Maybe.map Tuple.first)
    |> Maybe.values
-}
-- Multiple Maybe arguments
{-
   > String.append (Just "hi") (Just "Darwin")
   Just "hi Darwin" : Maybe.Maybe String

   > String.append (Just "hi") Nothing
   Nothing : Maybe.Maybe String

   > Maybe.map String.append (Just "hi") Just ("Darwin")
   produces type mismatch `map` was expecting 2 arguments but was given 3

   * Note: There are four additional variants of map: map2, map3, map4, map5
   > Maybe.map2 String.append (Just "hi") (Just "Darwin")
   Just "hi Darwin" : Maybe.Maybe String

-}
-- Designing Types
{-
       > Maybe.Extra.values
       <function>: List (Maybe a) -> List a

       values : List (Maybe a) -> List a
       values maybe = List.filterMap identity maybe

       * point-free example
       values : List (Maybe a) -> List a
       values = List.filterMap identity

   * List.filterMap accepts a function with (\a -> Maybe b) and unwraps the Maybe b
   * By supplying the identity function with make (\Maybe a -> Maybe b) -> List Maybe.Maybe Int -> List b
      List.filterMap : (a -> Maybe b) -> List a -> List b
      List.filterMap identity [(Just 10), Nothing, (Just 20]
      [10, 20] : List Int

-}


module Main exposing (..)
