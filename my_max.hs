my_max :: Ord a => a -> a -> a
my_max x y
    | x < y = y
    | otherwise = x

main = do
    putStrLn(show(my_max 1 2))
    putStrLn(show(my_max 4 3))