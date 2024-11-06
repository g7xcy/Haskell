my_sum :: Num a => [a] -> a
my_sum [] = 0
my_sum (x:xs) = x + my_sum xs

main = do
    putStrLn(show(my_sum [1..100]))
