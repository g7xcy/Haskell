cal1 :: (Int, Int) -> (Int, Int) -> Int
cal1 (x1, y1) (x2, y2)
    | prod > 100 = 999
    | prod < 10 = 0
    | otherwise = prod + 1
    where prod = x1*x2 + y1*y2

main = do
    putStrLn(show(cal1 (1, 2) (3, 4)))
    putStrLn(show(cal1 (1, 2) (300, 4)))
    putStrLn(show(cal1 (1, 2) (1, 4)))
