myMax :: (Ord a) => a -> a -> a
myMax x y
  | x < y = y
  | otherwise = x

main = do
  print (myMax 1 2)
  print (myMax 4 3)
