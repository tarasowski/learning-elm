-- Booleans


module Main exposing (c)


c =
    x == y



-- There is no ! point such as in JS, it's a functions that flips the bool


cnot =
    not (x == y)



-- Basically /= means not equal


cshorthand =
    x /= y



-- True


member =
    List.member 1 [ 1, 2, 3 ]



-- False


memberF =
    List.member 9 [ 1, 2, 3 ]


isKeepable num =
    num > 1


h =
    List.filter isKeepable 1 [ 1, 2, 3 ]


a =
    List.filter (\n -> num > 1) 1 [ 1, 2, 3 ]



-- comparison
