my_compare :: Ord a => a -> a -> Ordering
my_compare x y
    | x < y = LT
    | x > y = GT
    | otherwise = EQ

main = do
    putStrLn(show(my_compare 'a' 'b'))
    putStrLn(show(my_compare 'd' 'c'))
    putStrLn(show(my_compare 'e' 'e'))