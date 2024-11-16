myAdd :: Int -> Int -> Int
myAdd x y = x + y

myFoldl :: (a -> b -> b) -> b -> [a] -> b
myFoldl _ acc [] = acc
myFoldl f acc (x:xs) = myFoldl f (f x acc) xs

main = do
    print(myFoldl myAdd 0 [1..5])