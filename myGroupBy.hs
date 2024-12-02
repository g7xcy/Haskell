import Data.List (span)

myGroupBy :: (a -> a -> Bool) -> [a] -> [[a]]
myGroupBy _ [] = []
myGroupBy p (x:xs) = (x : ys) : myGroupBy p zs
  where
    (ys, zs) = span (p x) xs

main = do
  print (myGroupBy (>) [1, 3, 5, 1, 4, 2, 6, 5, 4])
  print (myGroupBy (==) [1, 1, 1, 2, 2, 3, 3, 3, 3, 3, 4, 5, 5, 5, 6])
  print (myGroupBy (\x y -> abs (x - y) <= 1) [1 .. 5])
