-- A prime number is:
-- 1. a natural number
-- 2. greater than 1
-- 3. divisible only by 1 and itself

-- The natural numbers are 0, 1, 2, 3, 4, ...

-- The prime numbers are therefore 2, 3, 5, 7, 11, ...

-- We know lots of prime numbers (https://primes.utm.edu/lists/small/millions/)
-- but not all of them

-- Let n > 1 be a natural number
-- and LD(n) the lowest natural number > 1 that divides n

-- A number d divides n if there exists a natural number 'a' such that a * d = n
-- That is, d divides n if there exists a natural number 'a' such that n / d = a
-- (i.e. n / d leaves no remainder)

-- LD(n) exists for every natural number > 1
-- because the natural number d = n is greater than 1 and divides n
-- i.e. for n = 3,
-- we have d = n = 3,
-- and n / d = 3 / 3 = 1 = a

-- Therefore, the set of divisors of n that are greater than 1 is non-empty

-- Proposition 1.2:
-- 1. If n > 1, then LD(n) is a prime number
--    proof by contradiction: if LD(n) is not prime then LD(n) can be divided!
-- 2. If n > 1 and n is not a prime number, then LD(n)^2 <= n
--    proof: suppose that n > 1 is not prime and that p = LD(n),
--    then there is a natural number a > 1 with n = p * a // e.g. 16 = 2 * 8
--    thus, a divides n.
--    since p is our LD(n) > 1, we have that p <= a
--    and therefore p^2 <= p * a
--    i.e. LD(n)^2 <= n

divides d n = rem n d == 0

ldf k n | divides k n = k
        | k^2 > n     = n
        | otherwise   = ldf (k+1) n

-- but ldf 3 8 should return 4?
-- (however this doesn't matter for our use of ldf within ld below,
-- where k always starts at 2 so if n <= 2^2 then k will be incremented
-- by one and the conditions checked again)

ld n = ldf 2 n

