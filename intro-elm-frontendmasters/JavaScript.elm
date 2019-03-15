-- Talking to JavaScript
{-
   * Subscriptions
    * See subscriptions.png

   * Guarantees
    * the elm talks to JS is called "client/server" communication ---> it's message passing.
    * it's sending immutable data from Elm to JavaScript and receiving immutable data from JavaScript to Elm
    * Elm sends data to JS and JS sends data to Elm (no direct function calls!) Instead we use commands and subscriptions to communicate to JS
    * You send a command on the Elm side, it's going to be a callback on JS side.
    * Cmd msg (it's not a Cmd Msg -> Msg is a type that we define). Here we use a type variable that is unbound, it could be also Cmd a

   * Type Variables
    * List.head : List elem -> Maybe elem
    * List.reverse : List val -> List val
    * List.length: List a -> Int
    * convert : List String : List String ---> as the same as below Html Msg --> means it takes a List of Strings and produces a List of Strings
    * div ... : Html Msg -> it produces Html with a Msg type
    * div [ onClick Toggle ] [] : Html Msg  ---> that's a div Html with a Msg type Toggle
    * img [ src "logo.png“ ] [] : Html a ---> since it doesn't do any event handling we can annotate it with Html a (where a can by anything)
    ** The type variable specifies here is the type of message this thing can produce in response to user input, but the image does nothing to user input. It doesn't broadcast any message.
    * [1,2,3] : List Int
    * [] : List a (List with an unbound type variable)

    * Html Msg this is compatible whtih Html that produces Msg
    * Html msg this is compatible with Html that produces anything
    * Cmd Msg produces message of type Msg works with update functions that accept Msg
    * Cmd msg works with any update function, because it never produces any messages!

   * Sending data to JS
   * Receiving data from JS
-}


module Main exposing (..)

{-
   on : String -> Decoder msg -> Attribute msg
   div [ on "mousemove" mousePointDecoder ] [..]

   Browser.onMouseMove : Decoder msg -> Sub msg
-}
