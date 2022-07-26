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

-- exercise 1.10: define a function removeFst that removes the first occurrence
-- of an integer m from a list of integers. If m does not appear in the list,
-- the list remains unchanged.

removeFst :: [Int] -> [Int]
