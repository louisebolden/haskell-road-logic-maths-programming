-- exercise 1.6: what might the type definition for rem look like?

-- rem :: Integer -> Integer -> Integer

rem 7 2
-- => 1

-- In fact, it is rem :: Integral a => a -> a -> a
-- which is a "type scheme" meaning "if `a` is a type of class Integral,
-- then `rem` is of type `a -> a -> a`

-- `a` ranges over various types
-- `[a]` is a "type scheme" rather than a type

-- Integral is the class consisting of `Int` (fixed precision)
-- and `Integer` (arbitray precision - storage allocated for the
-- object depends on the size of the object)

-- Fractional is a class that contains the Rational type

-- Rational is the type that results from applying the constructor Ratio to the
-- tyoe Integer

-- Float and Double represent floating point numbers (the elements of Double have
-- higher precision)
createFloat :: Float -> Float

-- The type `[Char]` is abbreviated as `String` i.e. a string is a list of chars
-- so we might have ['a', 'b', 'c'] or "abc" (notice the different quotes used)

-- Pair- or tuple-formation: (a, b) denotes a pair with an object of type a and
-- an object of type b; (a, b, c) denotes a triple, and so on
