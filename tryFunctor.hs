-- How to understand function ((->) r) as Functor?
-- First, functor must implement fmap function, where fmap :: (Functor f) -> (a -> b) -> f a -> f b
-- means that lift a function from (a -> b) to (f a -> f b).
-- For function ((->) r), the fmap is compose
-- fmap f g = f . g, because
-- f :: (a -> b)
-- g :: (f a) => ((->) r a) => (r -> a)
-- fmap f g :: (f b) => ((->) r b) => (r -> b)
-- f . g :: (r -> a) . (a -> b) => (r -> b)

-- Or just understand it by thinking g as "give an input of type r, create an output of type a"
-- and f as "give an input of type a, create an output of type b".
-- For fmap, think it as "apply the function f on the value in the functor g, which is the value of type a",
-- then the result is (r -> "apply (a -> b) on a"), means that "give an input of type r, create an output of type b"
main = do
  print $ (+ 1) <$> (* 7) $ 10
