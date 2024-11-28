splitOn :: (Eq a) => a -> [a] -> ([a], [a])
-- splitOn a = let f (left, right) = if null right then (left, []) else (left, tail right) in f . span (/= a)
splitOn a =
  let f (left, right) = case right of
        [] -> (left, [])
        (_ : xs) -> (left, xs)
   in f . span (/= a)

main = do
  -- line <- getLine
  print (splitOn ' ' "Hello World")
  print (splitOn ' ' "HelloWorld")
