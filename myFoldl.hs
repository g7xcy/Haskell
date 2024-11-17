myAdd :: Int -> Int -> Int
myAdd x y = x + y

myFoldl :: (b -> a -> b) -> b -> [a] -> b
myFoldl _ acc []     = acc
myFoldl f acc (x:xs) = myFoldl f (f acc x) xs

main = do
    print(myFoldl myAdd 0 [1, 2, 4, 8])
    print(myFoldl div 64 [4, 8])
