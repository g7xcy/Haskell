myElem :: Eq a => a -> [a] -> Bool
-- myElem x [] = False
-- myElem x (y:ys)
--     | x == y = True
--     | otherwise = myElem x ys
myElem y = foldl (\acc x -> x == y || acc) False

main = do
    print(myElem 3 [1..10])
    print(myElem 11 [1..10])
