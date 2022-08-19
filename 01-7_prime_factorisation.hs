-- from our prior work, we have that, for n != 1:
-- LD(n) exists
-- LD(n) is prime

divides d n = rem n d == 0

ldf_ k n | k == n      = k
         | k > n       = error "k is greater than n"
         | divides k n = k
         | otherwise   = ldf_ (k+1) n

ld n = ldf_ 2 n

-- we can then find prime factors as follows:

factors :: Integer -> [Integer]
factors n | n < 1     = error "n must be positive"
factors n | n == 1    = []
factors n | otherwise = p : factors (div n p) where p = ld n
