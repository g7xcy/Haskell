my_elem :: Eq a => a -> [a] -> Bool
my_elem x [] = False
my_elem x (y:ys) 
    | x == y = True
    | otherwise = my_elem x ys

main = do
    putStrLn( show( my_elem 3 [1..10]))
    putStrLn( show( my_elem 11 [1..10]))