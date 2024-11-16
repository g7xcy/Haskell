myElem :: Eq a => a -> [a] -> Bool
myElem x [] = False
myElem x (y:ys)
    | x == y = True
    | otherwise = myElem x ys

main = do
    print(myElem 3 [1..10])
    print(myElem 11 [1..10])
