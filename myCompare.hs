myCompare :: Ord a => a -> a -> Ordering
myCompare x y
    | x < y = LT
    | x > y = GT
    | otherwise = EQ

main = do
    print(myCompare 'a' 'b')
    print(myCompare 'd' 'c')
    print(myCompare 'e' 'e')