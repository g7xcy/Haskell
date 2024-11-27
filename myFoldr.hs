-- Actually, this is the source code from Haskell :)
myFoldr :: (a -> b -> b) -> b -> [a] -> b
myFoldr f i [] = i
myFoldr f i (x:xs) = f x (myFoldr f i xs)

main = do
    print $ myFoldr (+) 0 [1..100]
    print $ myFoldr (&&) True (repeat False)