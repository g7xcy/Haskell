my_take :: Int -> [a] -> [a]
my_take n _
    | n <= 0 = []
my_take _ [] = []
my_take n (x:xs) = x : my_take (n - 1) xs

main = do
    putStrLn(show(my_take 4 [1,2..]))