import           Data.List (find)

mySumDigit :: Int -> Int
mySumDigit 0 = 0
mySumDigit x = mod x 10 + mySumDigit (div x 10)

sumTo :: Int -> Int -> Maybe Int
sumTo n x = find ((==n) . mySumDigit) [1..x]

main = do
    print(sumTo 40 100)
    print(sumTo 40 49998)
    print(sumTo 40 599996)
    print(sumTo 40 50000)
    print(sumTo 19 50000)
