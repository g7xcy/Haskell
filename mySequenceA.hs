import Control.Applicative (getZipList, ZipList(..))

mySequenceA :: (Applicative f) => [f a] -> f [a]
-- mySequenceA [] = pure []
-- -- mySequenceA (x:xs) = liftA2 (:) x (mySequenceA xs)
-- mySequenceA (x:xs) = (:) <$> x <*> mySequenceA xs

-- mySequenceA = foldr (\x acc -> (:) <$> x <*> acc) (pure [])
mySequenceA = foldr (liftA2 (:)) (pure [])

main = do
    print $ mySequenceA [Just 1]
    print $ mySequenceA [Just 1, Just 2]
    print $ mySequenceA (fmap Just [1..10])
    print $ mySequenceA [[1,3..10], [2,4..10]]
    print $ mySequenceA ["Hello", "World"]
    print $ mySequenceA [[1..10]]
    print $ getZipList $ mySequenceA [ZipList [1, 2, 3]]
    print $ getZipList $ mySequenceA [ZipList [1,3..10], ZipList[2,4..10]]
    print $ getZipList . mySequenceA $ ZipList <$> [[1,3..10], [2,4..10]]
    print $ mySequenceA [(+1), (+2), (+3)] 4
