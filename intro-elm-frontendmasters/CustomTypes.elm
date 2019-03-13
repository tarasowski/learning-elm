-- Custom Types
{-
   * Those are all use cases for custom types:

      * case expressions
      * Enumeration
      * Containers
      * Variant Functions

-}


module Main exposing (Model)


type alias Model =
    { tab : String
    }



-- Custom type Tab. Tab has 3 possiblities also known as variance.
-- Custom types create a brand new types that didn't exist before.
-- Type alias are just giving a name for exisitng types. Compound types = type aliases
--
--
-- Capital letters are reserved for types and type annotations and custom types.
-- also konwn in other languages as "sum types" "union types" "ADTs"
-- type Tab ist a custom type and YourFeed | GlobalFeed | TagFeed are variants
--
--
-- The example of a container is TagFeed String -> we are putting the String into the TagFeed container
{-
   > type Tab = \
   |   YourFeed \
   |   | GlobalFeed \
   |   | TagFeed String
   > YourFeed
   YourFeed : Tab
   > TagFeed
   <function> : String -> Tab
-}


type Tab
    = YourFeed
    | GlobalFeed
    | TagFeed String


x2 : Model -> Char
x2 model =
    case model.tab of
        -- Enumerations
        YourFeed ->
            'a'

        -- Enumerations
        GlobalFeed ->
            'b'

        -- Container (that's hold additional information)
        -- this is how we can get the value out of the container. We give a name selectedTag here.
        -- this is the distinction between Capitalize and normal case. Lowercase means it's variable. Capital Case means it's a variant.
        TagFeed selectedTag ->
            'c'



-- Bool is a custom type. The variants are different. These values (variants) are different and cannot mixed together into one type. This is all about. There is nothing more about custom types.
-- True | False are variants
-- Bool is a custom type with two variants True or False --> Enumeration


type Bool
    = True
    | False



-- yours has a value YourFeed.


yours : Tab
yours =
    YourFeed



-- global has a value GlobalFeed


global : Tab
global =
    GlobalFeed


check =
    yours == YourFeed



-- tag has a value of TagFeed. Those 3 values are distinct values.


tag : Tab
tag =
    TagFeed


x : Model -> String
x model =
    case model.tab of
        "YourFeed" ->
            "all"

        _ ->
            "all"



-- Since using records as the type for the Msg is not scalable, we define a sum type Msg


type Msg
    = ClickedTag String
    | ClieckedPage Int



-- We can use pattern matching to get the value out of the container
-- In case of expression you need to cover all types, that's why you will never get null --> you need to return something e.g. Nothing
-- In Elm you always return something back, in if the same if is basically an expression like ternary in js true ? true : false
-- That's why you have also a catch all clause _ -> ...


update msg model =
    case msg of
        ClickedTag selectedTag ->
            selectedTag

        ClickedPage pageNumber ->
            pageNumber



-- Variant Function --> onClick (ClickedPage pageNumber)


pageButton : Int -> Html Msg
pageButton pageNumber =
    button [ oncClick (ClickedPage pageNumber) ]
