-- Module boundaries
{-
   * module Email exposing (Email(..)) -- this means we are exposing ValidEmail String
   * Every module that imports that module is going to have access to ValidEmail String and can actually not use it

   * module Email exposing (Email, fromString, toString)
   * Every module that imports that module needs to use type Email, so we are sure we'll get ValidEmail String
   * They can only get the email through the validation functions fromString, toString

    type Email =
       validEmail String
    fromString : String -> Result String Email
    toString: Email -> String


-}
-- Opaque Type
-- We are not exposing the variant Email of the type Email here. This is what it's called Opaque type.
-- By doing so we guarantee that other modules are going to use the proper API.
-- Opacitiy means that other modules can't look inside of it. The implementation details are hidden. Within the module where that custom type is defined.
-- Other examples of opaque types: Random.Generator, Decoder, Html. Those types are built-in the kernel code, underlying sytem level stuff inside Elm. It's internals are not just custom type.
-- Key thing here: it's not opacity of the type, it's more about what other modules can do. If it's opaque they can only annotate that they got one type. They can't look inside, they can't make new one.


module Email exposing (Email)


type
    Email
    -- type is exposed
    = Email -- variant is not exposed



-- Validatetion module example
{-

   module Validate exposing (Validator, Valid, fromValid)

   -- internals of type Valid. It's a wrapper.
   type Valid a =
       Valid a

    -- unwrapping the value from Valid type
    fromValid : Valid a -> a

    -- Validator has two type parameters the error and subject
    validate : Validator error subject -> subject -> Result (List error) (Valid subject)

    -- this tiny wrapper Valid ist the gate keeper. So you can't submit the from before it gets validated.
    submitForm : Valid From -> Http.Request User

-}
-- Credentations module example
{-
   module Credentails exposing (Cred, login)

   type Cred = .. -- credential values

   -- the only way to obtain the credential values
   login : LoginInfo -> Http.Request Cred

-}
-- Follow example
{-
   -- you always show the button to follow/unfollow people
   follow : Bool -> Author -> Html Msg

   -- you show only the follow/unfollow button if someone is logged in.
   -- because Cred is an opaque type, the only way to get creds is to be logged in
   follow : Cred -> Bool -> Author -> Html Msg

   -- a better vesion instead of having Bool (true/false), just have two different functions
   -- when do you want configuration, when do you want functions
   follow : Cred -> Author -> Html Msg
   unfollow : Cred -> Author -> Html Msg
-}
-- Author example
{-
         type Author
             = IsFollowing FollowedAuthor
             | IsNotFollowing UnfollowedAuthor
             | isViewer Cred Profile

         -- Opaque Type
         -- An author we're following
         type FolloweAuthor
             = FollowedAuthor Username Profile

         -- Opaque Type
         -- An author we're not following.
         type UnfollowedAuthor
             = UnfollowedAuthor Username Profile

      module Author
          exposing
              (Author(..)
              , FollowedAuthor
              , UnfollowedAuthor
              )

    -- The only ways we can get FolloweAuthor / UnfollowedAuthor we need to use those functions
    -- There is also inline destructuring goin on, it's the same as:
    -- instead of using case of we can destructure it inline see the second follow function
    follow unfollowedAuthor =
        case unfollowedAuthor of
            ((UnfollowedAuthor uname prof))

   follow : UnfollowedAuthor -> FollowedAuthor
   follow (UnfollowedAuthor uname prof) =
       FolloweAuthor uname prof

   unfollow : FolloweAuthor -> UnfollowedAuthor
   unfollow (FollowedAuthor uname prof) =
       UnfollowedAuthor uname prof)

-}
-- Type Destructuring
{-

   addHeader : Cred -> RequestBuilder a -> RequestBuilder a
   -- we are here destructuring the valuse of Cred type that holds a record {username: Username, token : String}
   -- so no need to write case of
   addHeader (Cred {token}) builder =
       builder
           |> withHeader "authorization" ("Token " ++ token)

    -- another case
    -- since it's not a record anymore and just a value constructor / container, we can destructure it in another way
    type Cred =
        Cred Username token
    addHeader (Cred _ token) builder =
        builder
            |> withHeader "authorization" ("Token " ++ token)

    -- in order to expose the Username we can add a function that does that. Since we don't want directly expose the internal implementation details of Cred
    username : Cred -> Username
    username (Cred uname _) =
        uname

    Module Examples exposing (Cred, username)

    -- in other module in order to access the username we can do as follow
    import Cred
    -- now we cann access the username
    username = Cread.username

    module Name exposing (Cred(..), username)
    -- means that other modules would be able to call the variants of Cred.

-}
