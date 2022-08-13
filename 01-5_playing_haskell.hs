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

removeFst_ :: Int -> [Int] -> [Int]
removeFst_ m [] = error "empty list"
removeFst_ m [x] | m == x = []
                | otherwise = [x]
removeFst_ m (x:xs) | m == x = xs
                   | otherwise = x : (removeFst m xs)

-- notes/corrections:
-- 1. we don't need to error on empty list! instead, return the empty list as
--    then we don't need to explicitly handle the cases where there is one
--    element remaining in the list and it either matches `m` or it doesn't

removeFst :: Int -> [Int] -> [Int]
removeFst m [] = []
removeFst m (x:xs) | m == x = xs
                   | otherwise = x : (removeFst m xs)

-- example: using mnmInt and removeFst to sort a list of integers in order of
-- increasing size

srtInts :: [Int] -> [Int]
srtInts [] = []
srtInts xs = m : (srtInts (removeFst m xs)) where m = mnmInt xs

-- notes from this example:
-- 1. we can refer to the entire list argument as expected (`xs`) rather than
--    always using the `(x:xs)` syntax to pop the first element
-- 2. we are setting `m` to be equal to smallest integer in the list here -
--    assume that m is a ref to an integer not to the element in the list
-- 3. this means we then need to use removeFst to modify the list

-- for educational purposes, we can write our own versions of sum and length:

sum_ :: [Int] -> Int
sum_ [] = 0
sum_ (x:xs) = x + sum_ xs

length_ :: [a] -> Int
length_ [] = 0
length_ (x:xs) = 1 + length_ xs

-- example of using toRational, in a function for finding the average
-- (because the division operator requires Rational operands in Haskell)

average :: [Int] -> Rational
average xs = toRational (sum xs) / toRational (length xs)

-- exercise 1.13: write a function for counting the number of occurences
-- of a character in a string

count :: Char -> String -> Int
count c [] = 0
count c (x:xs) | c == x = 1 + (count c xs)
               | otherwise = count c xs

-- exercise 1.14: write a function that duplicates each character in a string
-- e.g. "abc" becomes "aabbcc"

blowup :: String -> String
blowup [] = ""
blowup (x:xs) = [x] ++ [x] ++ blowup xs

-- exercise correction: the requirement is to duplicate each letter c_i
-- (i+1) times, e.g. "abc" becomes "abbccc"

duplicateChar :: Char -> Int -> String
duplicateChar c n | n < 2 = [c]
                  | otherwise = [c] ++ (duplicateChar c (n - 1))

strExpander :: String -> Int -> String
strExpander [] n = ""
strExpander (x:xs) n = duplicateChar x n ++ (strExpander xs (n + 1))

blowup2 :: String -> String
blowup2 str = strExpander str 1

-- exercise 1.15: write a function that sorts a list of strings in alphabetical
-- order

-- first, generalise the functions used by srtInts (removeFst and mnmInt)

removeFstAny :: Eq a => a -> [a] -> [a]
removeFstAny element [] = []
removeFstAny element (x:xs) | x == element = xs
                            | otherwise = x : (removeFstAny element xs)

mnmAny :: Ord a => [a] -> a
mnmAny [] = error "empty list"
mnmAny [x] = x
mnmAny (x:xs) = min x (mnmAny xs)

-- now can use in our srtString function

srtString :: [String] -> [String]
srtString [] = []
srtString [x] = [x]
srtString xs = m : (srtString (removeFstAny m xs)) where m = mnmAny xs

-- example 1.16: the function `prefix` returns true or false, depending on
-- whether the first string argument is a prefix of the second string argument.

-- prefixes of a string `ys` are defined as follows:

-- 1. `[]` is a prefix of `ys`

-- 2. if `xs` is a prefix of `ys`, then `x:xs` is a prefix of `x:ys`
--    (if "yep" is a prefix of "yeppers", then "ep" is a prefix of "eppers"
--    OR if "yep" is prefix of "yeppers", then "ayep" is prefix of "ayeppers"?
--    uncertain of meaning of `x:xs` and `x:ys` here)

-- 3. nothing else is a prefix of `ys`
--    (this just means no further checks needed?)

-- the following code implements this definition:

prefix :: String -> String -> Bool
prefix [] ys = True
-- prefix (x:xs) [] = False
-- (the above line was given but the below also works?)
prefix xs [] = False
prefix (x:xs) (y:ys) = x == y && prefix xs ys

-- exercise 1.17: write a function that checks whether string1 is a substring
-- of string2.
-- the substrings of an arbitrary string `ys` are given by:
-- 1. if `xs` is a prefix of `ys`, `xs` is a substring of `ys`
-- 2. if ys equals y:ys' and xs is a substring of ys', xs is a substring of ys
--    (if ys = "ep" and xs is substring of "yep", xs is substring of "ep" (??)
--    OR if ys = "ayep" and xs is substr of "yep", xs is a substr of "ayep"
--    ... only the latter interpreation is true?)
-- 3. nothing else is a substring of ys

substring :: String -> String -> Bool
substring [] ys = True
substring xs [] = False
substring xs (y:ys) = prefix xs (y:ys) || substring xs ys

-- the provided solution:

substring_ :: String -> String -> Bool
substring_ [] ys = True
substring_ (x:xs) [] = False
substring_ (x:xs) (y:ys) = ((x==y) && (prefix xs ys)) || (substring_ (x:xs) ys)

-- I believe the only meaningful difference here is in the final line, and in my
-- opinion there is no need to check x == y before calling (prefix xs ys) as
-- calling (prefix xs (y:ys)) accomplishes the same result, e.g.:
-- substring_ "yep" "yeppers -> 'y' == 'y' && prefix "ep" "eppers" is true
-- substring "yep" "yeppers" -> prefix "yep" "yeppers" is true
-- there is no need for the initial check of the first letters being identical.
-- perhaps the aim is efficiency in not calling prefix unless two characters in
-- the strings are found to be equal? but prefix also stops & returns False as
-- soon as two characters are found to be unequal.
