my_reverse :: [a] -> [a]
my_reverse [] = []
my_reverse (x:xs) = my_reverse xs ++ [x]

main = do
    putStrLn(show(my_reverse [1..10]))