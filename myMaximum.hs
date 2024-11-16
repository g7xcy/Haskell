myMaximum :: Ord a => [a] -> a
-- myMaximum []     = error "not empty list expected"
-- myMaximum [x]    = x
-- myMaximum (x:xs) = max x (myMaximum xs)

-- myMaximum (x:xs) = foldl max x xs
myMaximum = foldl1 max

main = do
    print(myMaximum [1, 10, 8, 19, -2, 3, 0, 4])
