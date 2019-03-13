-- There are no if statement in Elm
-- In Elm everything is an expression


module Main exposing (pluralize)


pluralize singular plural quantity =
    if quantity == 1 then
        singular

    else
        plural


main =
    text (pluralize "leaf" "leaves" 1)



-- In Elm else is required because it's an expression
{-
   x = if quantity == 1 then
     singular
     else
       plural

   JS: x = (quantity === 1 ? singular : plural)

-}
