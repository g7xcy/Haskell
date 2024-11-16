myMap :: (a -> b) -> [a] -> [b]
-- myMap _ []     = []
-- myMap f (x:xs) = f x : myMap f xs
myMap f = foldl (\acc x -> acc ++ [f x]) []

double :: Num a => a -> a
double x = x * 2

square :: Num a => a -> a
square x = x ^ 2

main = do
    print(myMap double [1..10])
    print(myMap (replicate 3) "hello,world")
    print(myMap (myMap square) [[1], [2, 3], [4, 5, 6]])
