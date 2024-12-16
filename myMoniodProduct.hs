newtype Product a = Product {getProduct :: a} deriving (Eq, Ord, Read, Bounded, Show)

instance (Num a) => Semigroup (Product a) where
  (<>) (Product x) (Product y) = Product (x * y)

instance (Num a) => Monoid (Product a) where
  mempty = Product 1

newtype All = All {getAll :: Bool}

instance Semigroup All where
  (<>) (All m) (All n) = All (m && n)

instance Monoid All where
  mempty = All True

main = do
  print $ getProduct . Product <$> [1 .. 10]
  print $ getProduct . mconcat $ Product <$> [1 .. 5]
  print $ getProduct $ Product 10 <> Product 130
  print $ getProduct (mempty :: Product Int)

  print $ getAll (mempty :: All)
  print $ getAll . All <$> replicate 4 True
  print $ getAll . All <$> [True, True, True, False]
  print $ getAll . mconcat $ All <$> replicate 4 True
  print $ getAll . mconcat $ All <$> [True, True, True, False]
