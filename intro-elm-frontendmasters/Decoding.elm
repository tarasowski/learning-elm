-- Decoding JSON
{-
   * Decoding
   * In Js parseInt "42" return 42, but if you pass parseInt "hi" it returns NaN
   * See example below decode function how the decoding in Elm works
   * But you can also use json decoders. They are more flexible more general purpose version of String.toInt
   * decodeString Json.Decode.int doesn't return Maybe, it returns a result, with two variatns Ok, Err
      * Basically the main difference between Maybe and Result is that Result has a variant Err and it returns additional information about the error. While Maybe returns Nothing.

      type Mabe val
        = Just val
        | Nothing

      type Result x a
        = Ok a
        | Err x

   * Result

   { "user_id": 27 }
   JS: const id = json.id --> it returns undefined, there is no id property on the object

   * Pipeline Decoding
   * Optional & Nullable
-}


module Main exposing (decode)


decode str =
    case String.toInt str of
        Just num ->
            num * 10

        Nothing ->
            0


jsonDecode str =
    case Json.Decode.int str of
        Ok num ->
            num * 2

        Err error ->
            error



{-
   {"user_id": 27,
   "first_name": "Al",
   "last_name": "Kai"
   }
-}


type alias User =
    { id : Int
    , firstName : String
    , lastName : String
    }



-- Whenever we see capital letter it's because it's has been a custom type variant
-- There is other case in Elm when does comes up, when you specifically have a type alias of a Record (type alias User)
-- Usually if we have type alias User that is a records it needs to be populated with the values. So therefore User is a function that takes Int, String, String and returns one of this records.
-- It's called a Record Constructor
--
-- In the user function we see the mapping between Json and our type alias user
-- Json.Decode.succed we pass a function User (that is a Record Constructor). It decoding suceeds I want you to use the function User to build the result.
-- Then we are piping that into required (which is a library) it says give me the field name which is "user_id" and give me a decoder describing the type of value your are expecting at that field.
-- We are mapping the Json to the type alias User
-- It remembers me on the Applicative that fills the values into a function
--
-- int, string is written as lowecase letters because they are coming from the Json.Decode module. You reference them unqualified like that.


user : Decoder User
user =
    Json.Decode.succeed User
        |> required "user_id" int
        |> required "first_name" string
        |> required "last_name" string



-- To decode a list


users : Decoder (List User)
users =
    list user


name : Decoder String
name =
    userName



{-

   { "user_id": 27,
   "name" : null
   }
-}


type alias NewUser =
    { id : Int
    , name : Maybe String
    , email : String
    }


newUser : Decoer User


user =
    Json.Decode.succeed User
        |> required "user_id" int
        |> required "name" (nullable string)
        -- takes a decoder string and gives you back a decoder string
        -- if the field is present we expect to be a string. However when the email is not present we need to fall back to "me@foo.com"
        |> optional "email" string "me@foo.com"
