myReverse :: [a] -> [a]
-- myReverse []     = []
-- myReverse (x:xs) = myReverse xs ++ [x]

-- myReverse = foldl (\acc x -> x : acc) []

myReverse = foldl (flip (:)) []

main = do
    print(myReverse [1..10])
