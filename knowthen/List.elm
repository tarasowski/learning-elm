module List exposing (..)
-- Adding to a List
{-
-- append ++ (append value to a list)
newPlayers = players ++ [player]

-- cons :: (put a value in front of a list)
newPlayers = player :: players

* The difference between those two operations:
-- a list is a linked structure
-- the first element is linked to the second, the second is linked o the third
myList = [el1, el2, el3]

-- list can be written as this
myList = el1 :: el2 :: el3 :: []

-- Append
-- Elm needs to traverse the whole list in order to put the el4
newList = myList ++ [el4]
newList = el1 :: el2 :: el3 :: el4 :: []

-- Cons
-- No traversing just put the new element as the first element
newList = el4 :: myList
-- el4 is the head and el1, el2, el3 are called tail
newList = [el4, el1, el2, el3]
-}
