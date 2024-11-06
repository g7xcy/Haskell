my_qsort :: Ord a => [a] -> [a]
my_qsort [] = []
my_qsort [x] = [x]
my_qsort (x:xs) = my_qsort [y | y <- xs, y < x] ++ [x] ++ my_qsort [y | y <- xs, y >= x]

main = do
    putStrLn( show( my_qsort [10000000, 10000000-1..1]))