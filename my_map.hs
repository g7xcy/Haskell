my_map :: [a] -> (a -> b) -> [b]
my_map [] _ = []
my_map (x:xs) f = f x : my_map xs f

double :: Num a => a -> a
double x = x * 2

main = do
    putStrLn(show(my_map [1..10] double))
