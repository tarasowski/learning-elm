-- Extensible Data
{-

    * Don't use open records, they futur is not very secure in Elm. Could be discarded!

   * Contraint Unification
    * Type constraints
    * [] : List a -- where a is a type variable aka unbound type
    * "Hi, my name is " ++ name ++ "!"
        String            String  String
    * List.append : List a -> List a -> List a -- in this case List a is a parameterized type
    -- Identical
    * List String
    * List String

    -- More constrained (we are going with the more constrained type List String)
    * List String
    * List a

    -- Incompatible (type mismatch)
    * List String
    * List Int

   * Open and Closed Records
    -- Identical
    * { x : Int }
    * { x : Int }

    -- More contrained
    * { r | x : Int}
    * {     x : Int}

    -- Incompatible
    * { x : Int }
    * { foo : Int }


    { r | x : Int } {x : Int, y : Int }
    unify into { x: Int, y: Int} --> becuase this one is more constrained as the other

    > (\point -> point.x + point.y)
    {r | x : number, y : number } -> number

   * Why Open Record Exist

   * Extensible Custom Types

-}


module Main exposing (Model)

-- Closed record
-- Closed record means this is exactly the shape of this record
-- It's closed for extentions you can't make any sort variations on that


type alias ClosedFirstName =
    { firstName : String }



-- {firstName = "Sam"}
-- Closed record


firstName : ClosedFirstName
firstName =
    { firstName = "Sam" }



-- Open record
-- Open for extentions
-- {r | ...} means I got at least these fields possibly some more
-- when you call .username on a record you get the value whatever is on that field back
-- .username { r | username : a } -> a


type alias OpenFirstName r =
    { r | firstName : String }


test : { r | name : String } -> { r | name : String }
test =
    \record -> { record | name = "Li" }



-- Why do open records exits?


type alias Model =
    { name : String
    , age : Int
    , posts : List Post
    }



-- The second Model example does the same as the type alias Model
-- But the second Model is error prone, imagine we have Model String String String


type Model
    = Model String Int (List Post)



-- Why do we need records?
-- So we can use getName record = record.name -- to get the name out of the record
-- The .name syntax is the whole reason why records exits
--
--
-- Very error prone implementation of validate


validate : String -> String -> String -> Blah
validate email firstName lastName =
    "failure"



-- No longer error prone but doesn't support partial application anymore
-- It's a tradeoff but there is another way to do it.


validate2 : { email : String, firstName : String, lastName : String } -> Blah
validate2 { email, firstName, lastName } =
    "semi success"



-- If my model has the three fields you can pass in into a function because now it accepts an open record
-- It's better as taking the entire model as argument and it will work the same way as the others did


validate3 : { r | email : String, firstName : String, lastName : String } -> Blah
validate3 { email, firstName, lastName } =
    "semi success"



-- Another way to solve the problem is to make one of the parameters a custom type
-- Here Email is a separate notion of a String, called Email. When we have an Email it's conceptually different than a String
-- Email is a special type of String


validate4 : Email -> String -> String -> Blah


validte email firstName lastName =
    "semi success"



-- OPEN RECORD


type alias Article a =
    { a
        | title : String
        , tags : List String
    }



-- Extending a record


type alias Article2 a =
    { title : String
    , tags : List String
    , extraInfo : a
    }



-- TYPE PARAMETER


type Article3 extraInfo
    = Article
        { title : String
        , tags : List String
        }
        extraInfo


type Preview
    = Preview


type Full
    = Full Body



{-
   Decoder (Article3 Preview)
   Decoder (Article3 Full)
   -- you can pattern mach on Full to get the body
-}


title : Article3 a -> String


body : Article Full -> Body
