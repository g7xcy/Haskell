myFliter :: (a -> Bool) -> [a] -> [a]
myFliter _ [] = []
myFliter p (x:xs)
    | p x = x : myFliter p xs
    | otherwise = myFliter p xs

main = do
    print(myFliter even [1,2..100])
    print(myFliter even (replicate 10 1))