mySumDigit :: Int -> Int
mySumDigit 0 = 0
mySumDigit x = mod x 10 + mySumDigit (div x 10)

main = do
  print (mySumDigit 123)
  print (mySumDigit 231)
  print (mySumDigit 100)
