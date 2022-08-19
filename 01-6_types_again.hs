-- exercise 1.18: find expressions with the following types:
-- 1. [String]

answer1 = ["abc"]

-- 2. (Bool, String)

answer2 = (True, "abc")

-- 3. [(Bool, String)]

answer3 = [(False, "xyz")]

-- 4. ([Bool], String)

answer4 = ([True], "xyz")

-- 5. Bool -> Bool

negation :: Bool -> Bool
negation bool | bool == True = False
              | bool == False = True

-- exercise 1.19: use the interpreter command `:t` to find the types of the
-- following predefined functions:
-- 1. head

head :: [a] -> a
-- e.g. head [2,3,1] => 2

-- 2. last

last :: [a] -> a
-- e.g. last [2,3,1] => 1

-- 3. init

init :: [a] -> [a]
-- e.g. init [2,3,1,4,9] => [2,3,1,4]

-- 4. fst

fst :: (a, b) -> a
-- e.g. fst (2,1) => 2

-- 5. (++)

(++) :: [a] -> [a] -> [a]
-- e.g. [1] ++ [2] => [1,2]

-- 6. flip

flip :: (a -> b -> c) -> b -> a -> c
-- e.g. flip (>) 3 5 => true

-- 7. flip (++)

flip (++) :: [a] -> [a] -> [a]
-- e.g. flip (++) [2] [1] => [1,2]
