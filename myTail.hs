myTail :: [a] -> a
myTail = foldr1 (flip const)

main = do
    print(myTail [1..10])
