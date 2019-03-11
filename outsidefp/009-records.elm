-- Records
-- Exact types
{-
   * This kind of type says that a record must have exactly a particular set of typed fields
   > bossie
   {id = 134, name = "bossie", tags = ["heifer"] } : {id: number, name: String, tags: List String}

-}
-- Extensible types
{-
   > .name
   <function>: { b | name : a } -> a

   1) {b | ...} the parameter must be a record
   2) Whatever else is true of `b`, it must have a filed called name
   3) The field can have any type.
   4) the use of `-> a` after the record means the function must return a value of the same type as the `name` field

   > { b | name = 5}
   * It's the notation for chaning records. A value notation assigns a value to a field

   > hi : {record | name : String} -> String
   > hi record = "Hi " ++ record.name
-}
-- Summary of the two kinds of record types
{-
   * The difference between the two kinds of type signatures is all about how extra fields are handled.

   > {name1: type1, name2: type2} ...means that the value is only compactible with records that have the same set of field names.

   > { records | name1: type1, name2: type2} ...means is compactible with records that have at least `name1` and `name2`.
   * **Note:** This mechanism matching on part of record is sometimes called structural typing. (Not all static FP languages have it).

-}
-- Types aliases and records
{-
        * We can use Type aliases instead of typing long descriptions of fields.
        type alias Animal =
          { id: Int,
          , name : String
          , tags : List String
          }

       * We can now declare both values and functions in terms of `Animal`.

       bossie : Animal
       > bossie = {id = 134, name = "bossie", tags = ["heifer"]}
       * Note: The compiler would complain if one of the fields were omitted or if an extra field were added.

       > shorthand : Animal -> String
       shorthand animal =
         animal.name ++ " (" ++ (toString animal.id) ++ ")"
       > shorthand {id = 3, name = "foo", extra = Just 5}
       "foo 3" : String

       * However you might have an app with many types of records that have `String` `names` and `Int` `ids`.
       * Perhaps you have `Animal`, `Person`, and `Department` and... We want `shorthand` to apply to any of them
       * We can't use `Animal` because that demands a field `tags` that we are not interested in. We need a type that says:
       * any record, so long as it contains  an Int id and a String name. That is extensible type:
       type alias ContainsNameId whole =
         {whole | id: Int, name: String}

      shorthand : ContainsNameId record -> String
      > shorthand record =
          record.name ++ "( " ++ (toString record.id) ++ ")"

   P.130

-}


module Main exposing (..)
