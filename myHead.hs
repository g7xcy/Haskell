myHead :: [a] -> a
-- const :: a -> b -> a
myHead = foldl1 const

main = do
  print (myHead [1,2 .. 10])
