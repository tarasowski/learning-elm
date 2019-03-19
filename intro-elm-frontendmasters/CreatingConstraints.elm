-- Creating Constraints
{-
   * Units of Measure
   * Accessible HTML
   * The Never Type
   * Type Parameter Design
-}


module Main exposing (Cm(..), In(..), Lengh(..))


type Lenght units
    = Lenght Float units



-- Cm / In are placeholders


type Cm
    = Cm


type In
    = In


cm : Float -> Length Cm


inches : Float -> Length In


add : Length units -> Length units -> Length units



-- add (cm 5) (cm 12)
-- Length Cm
--
-- add (in 5) (in 12)
-- Length In
--
--
--
-- TYPE PARAMETER DESIGN
-- List (Attribute msg) -- unbound message type -- says I will accept any type of attribute you give me
-- List (Attribute Msg) -- concrete message type -- says give me an attribute that is specifically your Msg type (concrete)
-- List (Attribute Never) -- the never type -- says Only give me a list of unbound attributes. I they are not unbound I won't accept them.
{-

   > text "Hi"
   "<p>Hi</p>" : Html msg

   > p : List (Attribute msg) -> List (Html msg) -> Html msg
   p [] [ text "Hi" ]

   > p [ onClick Something ] [ text "Hi" ]
   Html Msg
   onClick : msg -> Attribute msg

   p : List (Attribute Never) -> List (Html msg) -> Html msg
   p [ class "neato" ] [ text "Hi" ] -- it will compile
   p [ onClick Something ] [ text "Hi" ] -- won't compile because of the Never type. You can pass anything but not a concrete type.
-}
--
-- The Never Type
-- "A Task that never fails" -- that is the meaning of Never
{-
   type Never =
       OneMore Never

   catch22 type. The entire purpose of this type is to prevent anyone from making Never.
   myNever : Never
   myNever =
       OneMore (OneMore (OneMore
   - give me something that is still unbound.
   - So type never says that you need to give anything that is unbound. No way to pass concrete types.
-}
{-
   -- Task is a sort of chainable command
   -- Write http request and convert them to Task
   -- When this request is done run this next Task
   -- By default Task have an Error type and success type
   -- I want a Task that does not produce errors
   Task.perform : (a -> msg) -> Task Never a -> Cmd msg

-}
