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


