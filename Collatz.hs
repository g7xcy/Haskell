collatz :: Int -> [Int]
collatz 1 = [1]
collatz x
    | even x = x : collatz (div x 2)
    | otherwise = x : collatz (x * 3 + 1)

main = do
    print(collatz 10)
    print(length (filter (\xs -> length xs > 15) [collatz x | x <- [1..100]]))
    print(length (filter (\xs -> length xs > 15) (map collatz [1..100])))
