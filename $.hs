main = do
  -- sum map f xs => (((sum map) f) xs)
  -- sum $ map f xs => (sum ((map f) xs))
  print (sum (map sqrt [1 .. 100]))
  print (sum $ map sqrt [1 .. 100])
  print (sum (filter (> 10) (map (* 2) [2 .. 10])))
  print (sum $ filter (> 10) $ map (* 2) [2 .. 10])
