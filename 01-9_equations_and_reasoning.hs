-- important!

-- in Haskell, `f x y = x * y` is a statement meaning the LHS and RHS have the
-- same value (as in mathematics)

-- contrastingly, in imperative programming languages, the `=` operator creates
-- a "destructive assignment statement", i.e. discard the old value of the LHS
-- and replace it with the value of the RHS, e.g. `x = x + 2`

-- so Haskell does not allow (invalid) variable reassignment:

-- x = 1
-- y = 2
-- x = x + y
-- x ... this hangs the interpreter
-- x = y - 1
-- x ... this returns 1 :)
