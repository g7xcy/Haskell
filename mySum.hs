mySum :: Num a => [a] -> a
-- mySum = foldr (+) 0
mySum []     = 0
mySum (x:xs) = x + mySum xs

main = do
    print(mySum [1..100])
