main = do
    print(map negate $ map abs [5,-3,-6,7,-3,2,-19,24] )
    print(map (\x -> negate (abs x)) [5,-3,-6,7,-3,2,-19,24] )
    print(map (negate . abs) [5,-3,-6,7,-3,2,-19,24] )

    print(map (\xs -> negate $ (^2) $ sum $ tail xs) [[1..5],[3..6],[1..7]] )
    print(map (negate . (^2) . sum . tail) [[1..5],[3..6],[1..7]] )

    print(sum (replicate 5 (max 6.7 8.9)))
    print((sum . replicate 5 . max 6.7) 8.9)
    print(sum . replicate 5 $ max 6.7 8.9)
    -- sum . replicate 5 = \x -> sum(replicate 5 x) = \x -> sum $ replicate 5 x
    print $ (sum . replicate 5 $ max 6.7 8.9) == (8.9 * 5)

    print(replicate 3 (product (map (*3) (zipWith max [1,2,3,4,5] [4,5,6,7,8]))))
    print(replicate 3 $ product $ map (*3) $ zipWith max [1,2,3,4,5] [4,5,6,7,8])
    print(replicate 3 . product . map (*3) . zipWith max [1,2,3,4,5] $ [4,5,6,7,8])

    print(sum(takeWhile (<10000) (filter odd (map (^2) [1..]))))
    print(sum $ takeWhile (<10000) $ filter odd $ map (^2) $ [1..])
    print(sum . takeWhile (<10000) $ filter odd $ map (^2) $ [1..])
    print(sum . takeWhile (<10000) . filter odd $ map (^2) $ [1..])
    print(sum . takeWhile (<10000). filter odd . map (^2) $ [1..])

    print
        $  "`$` likes pipeline operator in Elixir;"
        ++ "`.` will create a new function."
        ++ "Both have similar functions, but focus on different concepts."
