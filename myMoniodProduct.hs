newtype Product a = Product {getProduct :: a} deriving (Eq, Ord, Read, Bounded, Show)

instance (Num a) => Semigroup (Product a) where
  (<>) (Product x) (Product y) = Product (x * y)

instance (Num a) => Monoid (Product a) where
  mempty = Product 1

main = do
  print $ getProduct . Product <$> [1 .. 10]
  print $ getProduct . mconcat $ Product <$> [1 .. 5]
  print $ getProduct $ Product 10 <> Product 130
  print $ getProduct (mempty :: Product Int)
