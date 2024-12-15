-- The `Pair b a` on the left of the equal sign is the type constructor.
-- For example, `x :: Pair Int String`.
-- The `Pair (a, b)` on the right of the equal sign is the value constructor.
-- The `a` and `b` enclosed in parentheses are the types of the parameters of the value constructor.
-- For example `Pair (1, "hello")` creates a value of type `Pair String Int`.
-- `Pair (1, "hello") == (1, "hello")`.
newtype Pair b a = Pair {getPair :: (a, b)} deriving (Eq, Show, Read, Ord)

-- The `Pair c` is a partially applied type constructor.
-- For example, `Pair Int`. Its kind is `* -> *`.
instance Functor (Pair c) where
    fmap :: (a -> b) -> Pair c a -> Pair c b
    -- The `Pair (x, y)` here is a value constructed by the newtype value constructor `Pair`.
    -- `x` and `y` are concrete values.
    -- The same for `Pair (f x, y)`.
    fmap f (Pair (x, y)) = Pair (f x, y)

-- Summary: the newtype `Pair b a` swaps the types of `(a, b)`.
main = do
    print $ (getPair . Pair) (1, 23)
    print $ (+10) <$> Pair (1, 12)
