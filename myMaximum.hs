myMaximum :: Ord a => [a] -> a
myMaximum []     = error "not empty list expected"
myMaximum [x]    = x
myMaximum (x:xs) = max x (myMaximum xs)

main = do
    print(myMaximum [10,9..1])
