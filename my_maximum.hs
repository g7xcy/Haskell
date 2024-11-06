my_maximum :: Ord a => [a] -> a
my_maximum [] = error "not empty list expected"
my_maximum [x] = x
my_maximum (x:xs) = max x (my_maximum xs)

main = do
    putStrLn(show(my_maximum [10,9..1]))
