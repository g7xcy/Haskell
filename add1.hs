add1 :: (Num a) => [a] -> [a]
-- add1 [] = []
-- add1 (x:xs) = (x + 1) : add1 xs

-- add1 xs = map (+1) xs

add1 = map (+ 1)

main = do
  print (add1 (add1 [1, 2, 3, 4]))
