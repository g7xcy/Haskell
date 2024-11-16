myTake :: Int -> [a] -> [a]
myTake n _
    | n <= 0 = []
myTake _ [] = []
myTake n (x:xs) = x : myTake (n - 1) xs

main = do
    print(myTake 4 [1,2..])
