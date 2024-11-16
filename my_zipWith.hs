my_zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
my_zipWith _ [] _ = []
my_zipWith _ _ [] = []
my_zipWith f (x:xs) (y:ys) = f x y : my_zipWith f xs ys

main = do
    putStrLn( show( my_zipWith (+) [1..5] [1..5]))