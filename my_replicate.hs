my_replicate :: Int -> a -> [a]
my_replicate 0 _ = []
my_replicate x a = a : my_replicate (x - 1) a

main = do
    putStrLn(show(my_replicate 7 False))