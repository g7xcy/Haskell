my_add :: Int -> Int -> Int
my_add x y = x + y

my_foldl :: (a -> b -> b) -> b -> [a] -> b
my_foldl _ acc [] = acc
my_foldl f acc (x:xs) = my_foldl f (f x acc) xs

main = do
    putStrLn(show(my_foldl my_add 0 [1..5]))