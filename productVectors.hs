vecProduct :: (Num a) => (a, a) -> (a, a) -> a
vecProduct (x1, y1) (x2, y2) = x1 * x2 + y1 * y2

main = do
  print (vecProduct (1, 3) (2, 4))
