myFlip :: (a -> b -> c) -> (b -> a -> c)
-- myFlip f = g
--     where g x y = f y x
-- myFlip f y x = f x y
myFlip f = \x y -> f y x

f :: a -> a -> a
f x y = x

main = do
  print (f 1 2)
  print (myFlip f 1 2)
