myRepeat :: a -> [a]
myRepeat x = x : myRepeat x

main = do
  print (take 4 (myRepeat 1))
