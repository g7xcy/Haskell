mySum :: Num a => [a] -> a
-- mySum []     = 0
-- mySum (x:xs) = x + mySum xs

-- mySum = foldr (+) 0

mySum = foldl1 (+)

main = do
    print(mySum [1..100])
