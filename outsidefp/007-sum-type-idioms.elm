-- Sum Type Idioms
-- Making invalid values impossible
-- An import unifying idea: making it impossible to create an invalid value (or an impossible program state)
{-
      * Making invalid values impossible
      * Consider animals that have a name, a number or both.
      > (Just "Betsy", Nothing)
      > (Nothing, Just 12)
      > (Just "Betsy", Just 12)
   * The author didn't make a forth case, because it's not allowed. But if he would forgotten that, there's now way Elm could have stopped him from erring.

   * Consider other alternative:
   > type AnimalId =
     ByName String
     | ByNumber Int
     | ByBoth String Int

   * Now there is no way to create an animal with neither kind of identifier. Moreover any function that takes `AnimalId` as an argument to operate on must handle each of these cases.

   * This is an example of a common theme in FP: you should use the type system to prevent the creation of invalid values.

   * Another example in a game of tennis. To model the idea of score with a number you can use a sum type.
   * In tennis players can have a score of 0, 15, 30, or 40. However they cant have a score of 7
   > type Score = Love | Fifteen | Thirty | Forty
-}
-- Grouping Related Data
{-
   * If you are always passing two pieces of data around together, wrap them in a sum type or record
   > type Point = Point Float Float

-}
-- Type Tagging
-- Abstractions that destroy: Int and Float
{-
   * Using floats is completely unproblematic, so long as your program uses a float for exactly one measurement.
   * Once it uses Float to represent different things, you have a risk:

   > lowEnoughToDeployParachute: Float -> Bool --meters
   > fuelTakTooLow: Float -> Bool -- percentage
   > openHatch: Float -> Bool -- air pressure in standard atmosphere

   * Distinc types woul be preferable:

   > lowEnoughToDeployParachute: Height -> Bool
   > fuelTankTooLow: Percent -> Bool
   > openHatch: Percent -> Bool

   * Such code reduces the "surface area of risk". It means you no longer need to worry about passing a float-that-means-height to a function that expects floal-that-means-pressure.

   * Single constructor sum types are a way to construct such types:
   > type DripRate = DropsPerSecond Float
   > type Percent = Percent Float

   * If we have a function with this type signature:
   > dripFaster : Percent -> DripRate -> Driprate
   * We always make sure that Elm will not allow us to call it with the arguments backwards.

   * This use of types is sometimes called TAGGED TYPES.

   > type Tagged value = Tagged value
   * **Note:** Any type variable mentioned by a value constructor must also be added before the `=`
   * As eary as (Maybe a), we saw that not every constructor has to mention every type variable. `Nothing` for example doesn't mention `a`.
   * We have also seen that a constructor doesn't mention a type variable produces a value that's not of concrete type but rather a quantified type. For example, the `AsA` constructor leaves `b` alone.
   > AsA 1.3
   AsA 1.3: Silly Float b

   * It's possible to have a type variable that's not used in any constructor:
   type Tagged tag value = Tagged value
   * `tag` is a phantom type. It doesn't mean anything at runtime, because there is no constructor that uses it.
   * It does matter at compile time because every use of `Tagged` (the constuctor) produces a `Tagged` value that's still quantified by `tag`
   > Tagged 893.3
   Tagged 893.3 : Tagged tag Float

   * What we want is to narrow the `tag` to a concrete type, auch as Percent (or, for that matter, String). Todo that consider this function:
   > percent = Tagged
   <function> : value -> Tagged tag value
   * That's a valid pont-free definition. But now give `percent` a type annotation that narrows the result type to make both the `tag` and the `value` concrete:
   percent : Float -> Tagged Percent Float
   percent = Tagged

   * Elm allows you to shorten types with type aliases:
   type alias Percent = Tagged Percent Float
   percent : Float -> Percent
   percent = Tagged
-}


module Main exposing (..)
