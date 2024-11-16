myAnd :: [Bool] -> Bool
myAnd = foldr1 (&&)

main = do
    print(myAnd [True, True, True])
    print(myAnd [True, False, True])
