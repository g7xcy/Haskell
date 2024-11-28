myFind :: (a -> Bool) -> [a] -> Maybe a
myFind _ [] = Nothing
myFind f (x : xs)
  | f x = Just x
  | otherwise = myFind f xs

main = do
  print (myFind (== 5) [1 .. 4])
  print (myFind (== 5) [1 .. 5])
  print (myFind (== 5) [1 .. 10])
  print (myFind (> 7) [1 .. 100])
