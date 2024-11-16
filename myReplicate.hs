myReplicate :: Int -> a -> [a]
myReplicate 0 _ = []
myReplicate x a = a : myReplicate (x - 1) a

main = do
    print(myReplicate 7 False)
    