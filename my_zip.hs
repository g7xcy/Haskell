my_zip :: [a] -> [b] -> [(a, b)]
my_zip [] _ = []
my_zip _ [] = []
my_zip (x:xs) (y:ys) = (x, y) : my_zip xs ys

main = do
    putStrLn( show( my_zip [1..5] "abcde"))
    putStrLn( show( my_zip [1..10] "abcde"))
    putStrLn( show( my_zip [1..5] "abcdefghij"))