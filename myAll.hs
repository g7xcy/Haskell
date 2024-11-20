myAll :: (a -> Bool) -> [a] -> Bool
myAll f = foldr (\x acc -> f x && acc) True

main = do
    print(myAll (>40) [1..10])
    print(myAll (>40) [1..])
    print(myAll (>1) [1..])
    print(myAll (>=1) [1..100])

