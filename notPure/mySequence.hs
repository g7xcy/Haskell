-- mySequence :: (Monad m) => [m a] -> m [a]
-- mySequence = foldr (>>) (pure [])

-- main = do
--     mySequence (map print [1..10])
--     mySequence (map pure [1..10])
