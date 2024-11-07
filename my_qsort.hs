addToSmallOrBig :: Ord a => a -> (([a], [a]) -> a -> ([a], [a]))
addToSmallOrBig pivot (small, big) x
  | x < pivot = (x : small, big)
  | otherwise = (small, x : big)

my_qsort :: Ord a => [a] -> [a]
my_qsort [] = []
my_qsort [x] = [x]
my_qsort (x:xs) = my_qsort small ++ [x] ++ my_qsort big
    where (small, big) = foldl (addToSmallOrBig x) ([], []) xs


main = do
    putStrLn( show( my_qsort [100, 99..1]))
