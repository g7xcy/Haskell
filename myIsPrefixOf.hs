myIsPrefixOf :: (Eq a) => [a] -> [a] -> Bool
myIsPrefixOf _ [] = False
myIsPrefixOf [] _ = True
myIsPrefixOf (x:xs) (y:ys)
  | x == y = myIsPrefixOf xs ys
  | otherwise = False

main = do
  print (myIsPrefixOf [1 .. 5] [1 .. 10])
  print (myIsPrefixOf [1 .. 11] [1 .. 10])
  print (myIsPrefixOf [2 .. 5] [1 .. 10])
  print (myIsPrefixOf [1 .. 10] [1 .. 10])
  print (myIsPrefixOf [] [1 .. 10])
  print (myIsPrefixOf [1 .. 5] [])
