myTails :: [a] -> [[a]]
myTails [] = []
myTails xs@(y : ys) = xs : myTails ys

main = do
  print (myTails "Hello World")
