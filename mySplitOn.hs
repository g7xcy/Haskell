mySplitOn :: (Eq a) => a -> [a] -> ([a], [a])
-- mySplitOn a = let f (left, right) = if null right then (left, []) else (left, tail right) in f . span (/= a)
mySplitOn a =
  let f (left, right) = case right of
        [] -> (left, [])
        (_ : xs) -> (left, xs)
   in f . span (/= a)
