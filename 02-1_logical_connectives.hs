-- and, or, not, if-then, iff (if and only if)

-- conjunction (and)
-------------------------------
-- False && x = False
--  True && x = x

-- disjunction (or)
-------------------------------
-- inclusive vs exclusive (i.e. may both be true?)
-- in proofs, we use the INCLUSIVE definition: yes, both may be true
-- False || x = x
--  True || x = True

-- negation (not)
-------------------------------
--  not True = False
-- not False = True

-- implication (if-then)
-------------------------------
-- if P, then Q
-- P is the ANTECEDENT and Q is the CONSEQUENT of the implication
-- here we have the following super annoying truth table:
-- P | Q | P ⇒ Q
-- T | T |   T
-- T | F |   F
-- F | T |   T
-- F | F |   T
-- (the last two rows suck ... probably because implication in this sense does
-- not require causality e.g. "if 5 < n, then 3 < n" is not trying to convey that
-- 3 is also less than n _because_ 5 is less than n ... if we set n = 4, then we
-- see a situation where 5 is not less than n but 3 is, i.e. those two statements
-- are fairly independent)
-- in Haskell, we can define an infix `==>` as follows:
-- (==>) :: Bool -> Bool -> Bool
-- x ==> y = (not x) || y
-- or a "direct definition" (not sure what this means here):
--  True ==> x = x
-- False ==> x = True
-- we must not forget the CONVERSE (if Q, then P)
-- and CONTRAPOSITIVE (if !Q, then !P)
-- and note that the converse of a true implication needn't be true
-- but the contrapositive is true iff the implication is true

-- equivalence (iff)
-------------------------------

