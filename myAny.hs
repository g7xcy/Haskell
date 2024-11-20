myAny :: (a -> Bool) -> [a] -> Bool
myAny f = foldr (\x acc -> f x || acc) False

main = do
    print(myAny (>40) [1..10])
    print(myAny (>40) [1..])

