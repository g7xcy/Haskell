myLength :: [a] -> Int
-- myLength []     = 0
-- myLength (_:xs) = 1 + myLength xs
myLength = foldl (\acc _ -> acc + 1) 0

main = do
  print (myLength [1 .. 100])
