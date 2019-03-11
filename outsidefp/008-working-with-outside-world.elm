{-
   * The most important data type in Elm is named `Model`. It contains the entire state of the application.
   * That state contains at least enogh information to completely compute the app's HTML.
   * When it starts your app, the Elm runtime calls a function `init` which returns the first version of the model.
   * Model is used with two functions: update returns a new model, view produces HTML.

   * If you want to make e.g. http requests. The app cannot do that. Instead it requests the runtime to do that.
   * Such requests are typed Cmd Msg (where Cmd is predefined in Elm and Msg is the sum type you define)

   * In a pure language like Elm, the only way to get a value from a function ot its caller is in its return value.
   * Therefore `update` actually returns two values, wrapped in a Tuple: the new model and a command.

   * Here is an example of a case that does nothing at all, neither chaning the model nor asking the runtime to do anything:
   update : Msg -> Model -> (Model, Cmd Msg)
   update msg model =
     case msg of
       NoOp -> (model, Cmd.none)

-}


module Main exposing (..)
