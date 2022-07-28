-- exercise 1.6: what might the type definition for rem look like?

-- rem :: Integer -> Integer -> Integer

-- In fact, it is rem :: Integral a => a -> a -> a
-- which is a "type scheme" meaning "if `a` is a type of class Integral,
-- then `rem` is of type `a -> a -> a`

-- `a` ranges over various types
-- `[a]` is a "type scheme" rather than a type

-- Integral is the class consisting of `Int` (fixed precision)
-- and `Integer` (arbitray precision - storage allocated for the
-- object depends on the size of the object)

-- Fractional is a class that contains the Rational type

-- The type `[Char]` is abbreviated as `String` i.e. a string is a list of chars
-- so we might have ['a', 'b', 'c'] or "abc" (notice the different quotes used)

