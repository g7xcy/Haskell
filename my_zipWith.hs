my_zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
my_zipWith _ [] _ = []
my_zipWith _ _ [] = []
my_zipWith f (x:xs) (y:ys) = f x y : my_zipWith f xs ys

main = do
    putStrLn( show( my_zipWith (+) [1..5] [1..5]))
    putStrLn( 
        show( 
            my_zipWith 
                (my_zipWith (+)) 
                [[1, 2, 3], [4, 5, 6], [7, 8, 9]] 
                [[9, 8, 7], [6, 5, 4], [3, 2, 1]]))