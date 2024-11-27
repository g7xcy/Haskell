class NonStrictBool a where
    isTrue :: a -> Bool

instance NonStrictBool Int where
    isTrue 0 = False
    isTrue _ = True

instance NonStrictBool [a] where
    isTrue [] = False
    isTrue _ = True

instance NonStrictBool Bool where
    isTrue = id

instance (NonStrictBool a) => NonStrictBool (Maybe a) where
    isTrue (Just x) = isTrue x
    isTrue Nothing = False

main = do
    print $ isTrue (0 :: Int)
    print $ isTrue (1 :: Int)
    print $ isTrue ""
    print $ isTrue " "
    print $ isTrue "Hello"

    print $ isTrue []

    print $ isTrue False
    print $ isTrue True

    print $ isTrue (Just "")
    print $ isTrue (Just 3 :: Maybe Int)
    print $ isTrue (Nothing :: Maybe Int)