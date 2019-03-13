-- Types
-- 4 Type Annotations
{-
   * Primitives
   username : String
   username = "tarasowski"

   totalPages : Int
   totalPages = 5

   isActive : Bool
   isActive = True

   String.length : Stirng -> Int
   not : Bool -> Bool

   searchResult : {name : String, stars : Int }
   searchResult = {name = "lion", stars = 215}

   : is for types
   = is for values

   * Parameters
   -- List here is a Parameterized Type --> saying List is not enough, you need to specify to name a Type Parameter --> String
   -- name has a type a List of Strings
   names : List String
   names = ["Dimitri", "Anastasia"]

   * Aliases
   * See the model example below, if we are not using a type alias we need to write it out if we want to pass it into a function
   * In order to avoid it we give a type alias Name, so we can use the name as the reference to a type. Basically it's a composite type of other types.
   * Added below an example of type alias Article that is refered inside the model

   * Functions
   * See examples below update, view

-}


module Main exposing (model)


type alias Msg =
    { description : String
    , data : String
    }


type alias Article =
    { title : String
    , tags : List String
    , body : String
    }


type alias Model =
    { selectedTag : String
    , articles : List Article
    }



-- Here Html is Parameterized type. It means that this function is producing Html string messages. Because we put a string and passed it to onClick.
-- The update function is going to take a String as it's first argument


view : Model -> Html String
view model =
    button
        [ onClick "ClickedClear" ]
        [ text "X" ]



-- The update function is going to take a Msg as it's first argument


update : Msg -> Model -> Model
update msg model =
    model


view2 : Model -> Html Msg
view2 model =
    button
        [ onClick
            { description = "ClickedClear"
            , data = "ALL"
            }
        ]
        [ text "X" ]



-- The update function is going to take a Float as it's first argument


view3 : Model -> Html Float
view3 =
    model
        button
        [ onClick 2.6 ]
        [ text "X" ]
