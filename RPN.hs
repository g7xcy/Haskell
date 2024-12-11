-- 100 10 7 + 2 * - == 66
solveRPN :: String -> Double
solveRPN = head . foldl' f [] . words
    where 
        f (x:y:zs) "+" = y + x : zs
        f (x:y:zs) "-" = y - x : zs
        f (x:y:zs) "*" = y * x : zs
        f (x:y:zs) "/" = y / x : zs
        f xs num = read num : xs

main = do
    print $ solveRPN "100 10 7 + 2 * -"