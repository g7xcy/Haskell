main = do
  rs <- sequence [print "What is your name?" >> return "", getLine]
  print $ (!! 1) rs
