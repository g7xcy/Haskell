-- addToSmallOrBig :: Ord a => a -> (([a], [a]) -> a -> ([a], [a]))
-- addToSmallOrBig pivot (small, big) x
--   | x < pivot = (x : small, big)
--   | otherwise = (small, x : big)

-- myQsort :: Ord a => [a] -> [a]
-- myQsort [] = []
-- myQsort [x] = [x]
-- myQsort (x:xs) = myQsort small ++ [x] ++ myQsort big
--     where (small, big) = foldl (addToSmallOrBig x) ([], []) xs

myQsort :: Ord a => [a] -> [a]
myQsort [] = []
myQsort [x] = [x]
myQsort (x:xs) = myQsort small ++ [x] ++ myQsort bigOrEqual
  where small = [a | a <- xs, a < x]
        bigOrEqual = [a | a <- xs, a >= x]


main = do
  print(myQsort [100, 99..1])
