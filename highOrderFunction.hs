add :: Int -> (Int -> Int -> Int)
add a b c = a + b + c

add5 :: Int -> Int -> Int
add5 = add 5

add15 :: Int -> Int
add15 = add5 10



main = do
    print( add15 1)
