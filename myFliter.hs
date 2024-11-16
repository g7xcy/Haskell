myFliter :: (a -> Bool) -> [a] -> [a]
-- myFliter _ [] = []
-- myFliter p (x:xs)
--     | p x = x : myFliter p xs
--     | otherwise = myFliter p xs
myFliter f = foldl (\acc x -> if f x then acc ++ [x]  else acc) []

notNull :: [a] -> Bool
notNull xs = not(null xs)

main = do
    print(myFliter even [1,2..100])
    print(myFliter even (replicate 10 1))
    print(myFliter notNull [[1,2,3],[],[3,4,5],[2,2],[],[],[]])
