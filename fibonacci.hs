fibonacci :: [Integer]
-- zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
-- (zipWith f xs ys) applies f to each pair of elements from xs and ys,
-- and puts the result in a new list.
-- Here, zipWith sums each element of the fibonacci list with
-- the corresponding element of the fibonacci list without the first element.
-- zipWith will truncate to the length of the shorter list.
-- https://stackoverflow.com/questions/1105765/generating-fibonacci-numbers-in-haskell
fibonacci = 1 : 1 : zipWith (+) fibonacci (drop 1 fibonacci)

main = do
  print (take 4 fibonacci)
