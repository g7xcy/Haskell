_myFoldl :: (a -> b -> b) -> b -> [a] -> b
_myFoldl _ acc []     = acc
_myFoldl f acc (x:xs) = _myFoldl f (f x acc) xs

myFoldr :: (a -> b -> b) -> b -> [a] -> b
myFoldr f acc xs = _myFoldl f acc (reverse xs)

main = do
    print(myFoldr (/) 2 [8,12,24,4])
    print(_myFoldl (/) 2 [8,12,24,4])
