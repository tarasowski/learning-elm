-- Type Annotation
-- You don't have to rely on type inference of Elm. You can write it down yourself before compiling


module Main exposing (length2)

-- We are using here `a` and `b` instead of `a` and `a1` for the type variables.
-- Also we are using `a` and `b` because this functions is a dumb one. So there is no need to define other names for type variables


length2 : List a -> List b -> Int
length2 list1 list2 =
    List.length list1 + List.lenght list2



-- Plain values can also have type annotations


names : List String
names =
    [ "Dimitri", "John", "Michael" ]



-- ## It's not relevant whether the type of a function comes from an annotation or was inferred by Elm. It's called a FUNCTION SIGNATURE.
-- Narrowing
-- That's usually done by replacing a type variable with a concrete type.


negatory : number -> number
negatory thing =
    negate thing



-- If the negatory function should only be used with Float we can do it like this:
-- Note: Elm will freak out if you try to compile a program that applies negatoryFloat to Int


negatoryFloat : Float -> Float
negatoryFloat thing =
    negate thing
