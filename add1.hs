add1 :: Num a => [a] -> [a]
add1 [] = []
add1 (x:xs) = (x + 1) : add1 xs

main = do
    putStrLn(show(add1(add1 [1, 2, 3, 4])))
