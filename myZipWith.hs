myZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
myZipWith _ [] _ = []
myZipWith _ _ [] = []
myZipWith f (x:xs) (y:ys) = f x y : myZipWith f xs ys

main = do
    print(myZipWith (+) [1..5] [1..5])
    print(myZipWith 
            (myZipWith (+)) 
            [[1, 2, 3], [4, 5, 6], [7, 8, 9]] 
            [[9, 8, 7], [6, 5, 4], [3, 2, 1]])