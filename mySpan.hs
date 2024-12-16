mySpan :: (a -> Bool) -> [a] -> ([a], [a])
mySpan _ [] = ([], [])
mySpan p (x : xs)
  | p x = (x : ys, zs)
  | otherwise = ([], x : xs)
  where
    (ys, zs) = mySpan p xs

main = do
  print (mySpan (< 5) [1 .. 10])
  print (mySpan (< 1) [1 .. 10])
  print (mySpan (< 100) [1 .. 10])
  print (mySpan (== 1) [1 .. 10])
  print (mySpan (< 3) [1, 2, 3, 4, 1, 2, 3, 4])
