-- instance Monad [] where
--     xs >>= f = concat (map f xs)
-- concat :: [[a]] -> [a]
main = do
  -- foldr (>>) (pure ()) ([1..10] >>= \x -> [print x])
  sequence_ ([1 .. 10] >>= \x -> [print x])
