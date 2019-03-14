-- Maybe
{-
   * List.head
   * Just String --> Just is a wrapper around the String. To unwrap is you need to run case of expression.

   * Maybe
   * Maybe is a custom type "sum type"
   * Maybe is a parametirized type and it expectes a parameter

   * Type varaibles
   * List.head : List a -> Maybe a
   * List.head takes a List of some type and should return the Maybe wrapped with the same type

   * Pipelines
   * What the pipeline basically says is take [2,4,6] |> and put it as the last argument to List.filter (\x -> x < 5) |> the returned value put as the |> last argument to List.reverse
   * Data comes last, we can do it because we partially applied List.filter with the first argument
   * |> is a function, it's not an operator. It's an infix function.

   [2,4,6]
    |> List.filter (\x -> x < 5)
    |> List.reverse
-}


module Main exposing (..)
