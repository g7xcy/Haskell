-- How to understand ((->) r) as Applicative Functor?
-- First, understand that r is type, not value.
-- (f <$> g <*> h) creates a calculation tree, where
-- (f <$> g) means f is the root node of the sub tree
-- (g <*> h) means g and h are of the same level under f, that
--    f
--   / \
-- g     h

-- Or from the defination:
-- pure x = \_ -> x = const x
-- f <*> g = \x -> (f x) (g x), where
-- f :: (r -> (a -> b))
-- g :: (r -> a), thus
-- (\x -> g x) :: a, where x is the value of type r, and
-- (\x -> f x) :: a -> b, where x is the value of type r, thus
-- (\x -> (f x) (g x)) :: b, means that "result of applying (a -> b) to a is b"
main = do
  print $ (+) <$> (* 97) <*> (+ 101) $ 5
  print $ (+) ((*) 97 5) ((+) 101 5)
  print $ (97 * 5) + (101 + 5)

  print $ pure (* 3) <*> Just 5
  print $ pure (replicate 10) <*> "HelloWorld"
  print $ pure (replicate 10) <*> ["HelloWorld"]

  print $ liftA2 (*) (Just 9) (pure 11)
  let f = liftA2 (:) in print $ f (Just 9) (f (Just 3) (Just []))
