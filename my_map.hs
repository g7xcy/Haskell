my_map :: (a -> b) -> [a] -> [b]
my_map _ [] = []
my_map f (x:xs) = f x : my_map f xs

double :: Num a => a -> a
double x = x * 2

main = do
    putStrLn(show(my_map double [1..10]))
    putStrLn(show(my_map (replicate 3) "hello,world"))
