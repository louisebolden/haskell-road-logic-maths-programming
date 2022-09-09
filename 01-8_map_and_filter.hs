-- the type definition of `map` is great:

-- map :: (a -> b) -> [a] -> [b]

-- `(a -> b)` is a function that recieves a value of type `a` and returns
-- a value of type `b`

-- `[a]` is an array of values of type `a`

-- (the above are the two arguments that `map` takes)

-- the return value of `map` is then an array of values of type `b`

-- thus we see that `map` returns the result of calling the input
-- function on every element in the input list

mapExample = map (^2) [1,2,3,4,5]
-- => [1,4,9,16,25]

-- SIDENOTE: conversion from infix to prefix, construction of sections

-- if `op` is an infix operator, e.g. `+`
-- then `(op)` is the prefix version of that operator, e.g. `(+)`

-- thus `2^10` can also be written as `(^) 2 10`

mapExample2 = map (2^) [1..10]

-- exercise 1.20: use `map` to write a function `lengths` that takes a list
-- of lists and returns a list of the corresponding list lengths

lengths :: [[a]] -> [Int]
lengths [] = []
lengths (x:xs) = length x : lengths xs

-- oops, supposed to use `map`:

lengths_ :: [[a]] -> [Int]
lengths_ [] = []
lengths_ xs = map length xs

-- from the provided answers:
lengths__ :: [[a]] -> [Int]
lengths__ = map length
-- no need for special handling of empty array case
-- and apparently can pass the arg to `length` implictly!

-- exercise 1.21: use `map` to write a function `sumLengths` that takes a list
-- of lists and returns the sum of their lengths

sumLengths :: [[a]] -> Int
sumLengths [] = 0
sumLengths (x:xs) = l + (sumLengths xs) where l = length x

-- once again, rewrite to use `map`:

sumLengths_ :: [[a]] -> Int
sumLengths_ xs = sum (map length xs)

-- we can make an infinite list of primes using `filter`

-- first, redefine required functions that we created in earlier files

divides d n = rem n d == 0

ldf_ k n | k == n      = k
         | k > n       = error "k is greater than n"
         | divides k n = k
         | otherwise   = ldf_ (k+1) n

ld n = ldf_ 2 n

prime0 n | n < 1     = error "not a positive integer"
         | n == 1    = False
         | otherwise = ld n == n

-- now we can have...

primes0 :: [Integer] -- no args; define output type only
primes0 = filter prime0 [2..]

-- (press ctrl+c to stop :)

-- now we can improve our `ld` function because, in searching for the lowest
-- divisor of `n`, there is no need to check composite divisors; if 2 does not
-- divide `n` then neither will 4 or any other multiple of 2

-- lpd :: Integer -> Integer
-- lpd n = lpdf primes1 n

-- lpdf will take a list of primes to check against n
lpdf :: [Integer] -> Integer -> Integer
lpdf (p:ps) n | rem n p == 0 = p -- we found the lowest prime divisor
              | p^2 > n      = n -- we found that n is prime/is its own lpd
              | otherwise    = lpdf ps n

primes1 :: [Integer]
primes1 = 2: filter prime [3..]

-- find if n is prime by seeing if it is its own lowest prime divisor
prime :: Integer -> Bool
prime n | n < 1     = error "not a positive integer"
        | n == 1    = False
        | otherwise = lpd n == n

-- note the circularity of references between the functions above!
-- (lpd calls primes1; primes1 calls prime; prime calls lpd)
-- if we change the definition of primes1 to:
-- primes1 = filter prime [2..]
-- then we get a stack overflow because...
-- "to make [a] function [that iterates over an infinite list] start returning
-- data before evaluating completely (which it can never do), you need to first
-- return the non-recursive cases, and then append the recursive cases to them
-- https://stackoverflow.com/a/47679271/8523272
-- so here we need to return a first value from the `lpdf` function before we
-- start iterating over the infinite list of primes > 3 in `primes1`
-- what if we had:
-- primes1 = filter prime [3..]
-- this results in stack overflow, too
-- presumably `filter prime [3..]` runs forever once `primes1` is called?
-- ah yes - changing `primes1` to:
-- primes1 = [2..]
-- does not cause stack overflow

-- exercise 1.24: what happens when you modify the defining equation of `ldp`
-- as follows:
lpd :: Integer -> Integer
lpd = lpdf primes1

-- my initial guess was an error as `lpdf primes1` seems to be missing the second
-- argument for `lpdf` ... but this seems incorrect.
-- perhaps haskell will automatically append the argument included in the type
-- definition to the end of the LHS & RHS of the function definition?

testFn :: Integer -> Integer
testFn = (4*)

-- yes, it would seem so! what about...

testFn_ :: Integer -> Integer
testFn_ = (*4)

-- this seems to work as expected, too :)

-- the answer given almost makes it sound like we can cancel `n` from both sides!

-- "The final argument n in the definition can be left out, for saying that ldp
-- is the function that results from applying ldpf to primes1 is equivalent to
-- saying that ldp is the function that for any argument n does the same as what
-- (ldpf primes1) does for argument n."
