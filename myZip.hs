myZip :: [a] -> [b] -> [(a, b)]
myZip [] _          = []
myZip _ []          = []
myZip (x:xs) (y:ys) = (x, y) : myZip xs ys

main = do
    print(myZip [1..5] "abcde")
    print(myZip [1..10] "abcde")
    print(myZip [1..5] "abcdefghij")
