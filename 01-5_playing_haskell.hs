-- mixed examples and exercises

mnmInt :: [Int] -> Int
mnmInt [] = error "empty list"
mnmInt [x] = x
mnmInt (x:xs) = min x (mnmInt xs)

-- does the last line mean essentially:
-- min x_1 x_2 x_3 x_4 x_5 ...?
-- does x represent each list element in turn?
-- `min x (mnmInt xs)` must pop the first element out of the list
-- and call mnmInt with the new shorter list?
-- otherwise, we'd never get out of this recursion!

-- exercise 1.9: define a function that gives the maximum of a list of integers

mxmInt :: [Int] -> Int
mxmInt [] = error "empty list"
mxmInt [x] = x
mxmInt (x:xs) = max x (mxmInt xs)

-- exercise 1.10: define a function removeFst that removes the first occurrence
-- of an integer m from a list of integers. If m does not appear in the list,
-- the list remains unchanged.

-- first solution:

removeFst :: Int -> [Int] -> [Int]
removeFst m [] = error "empty list"
removeFst m [x] | m == x = []
                | otherwise = [x]
removeFst m (x:xs) | m == x = xs
                   | otherwise = x : (removeFst m xs)

-- notes/corrections:
-- 1. we don't need to error on empty list! instead, return the empty list as
--    then we don't need to explicitly handle the cases where there is one
--    element remaining in the list and it either matches `m` or it doesn't

removeFst_ m [] = []
removeFst_ m (x:xs) | m == x = xs
                    | otherwise = x : (removeFst m xs)
