myFoldl :: (b -> a -> b) -> b -> [a] -> b
myFoldl f i [] = i
myFoldl f i (x:xs) = myFoldl f (f i x) xs

main = do
    print $ myFoldl (+) 0 [1..100]
    print $ myFoldl (flip (:)) [] [1..100]
    print $ myFoldl (&&) True (repeat False)