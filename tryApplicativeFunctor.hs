main = do
    print $ pure (*3) <*> Just 5
    print $ pure(replicate 10) <*> "HelloWorld"
    print $ pure(replicate 10) <*> ["HelloWorld"]