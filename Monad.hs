-- pure :: a -> Monad a
-- bind :: (a -> Monad b) -> Monad a -> Monad b

main = do
  print $ concatMap init [[1, 1, 1], [2, 2]]
  print $ init =<< [[1, 1, 1], [2, 2]]
