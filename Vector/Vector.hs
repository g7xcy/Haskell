{-# LANGUAGE DeriveFunctor #-}
module Vector () where
    import Control.Applicative
    import Control.Monad (liftM)
    data Vector a =   Vector2 a a 
                    | Vector3 a a a 
                    | Vector4 a a a a deriving (Eq, Functor, Show)

    instance Applicative Vector where
        pure x = Vector2 x x

        fmap f (Vector2 a b)     = Vector2 (f a) (f b)
        fmap f (Vector3 a b c)   = Vector3 (f a) (f b) (f c)
        fmap f (Vector4 a b c d) = Vector4 (f a) (f b) (f c) (f d)

        (Vector2 f g)     <*> (Vector2 x y)     = Vector2 (f x) (g y)
        (Vector3 f g h)   <*> (Vector3 x y z)   = Vector3 (f x) (g y) (h z)
        (Vector4 f g a b) <*> (Vector4 x y u v) = Vector4 (f x) (g y) (a u) (b v)
        _ <*> _ = error "Unsupported Vector sizes"

    dotProduct :: Num a => Vector a -> Vector a -> a
    dotProduct (Vector2 a1 a2)       (Vector2 b1 b2)       = a1 * b1 + a2 * b2
    dotProduct (Vector3 a1 a2 a3)    (Vector3 b1 b2 b3)    = a1 * b1 + a2 * b2 + a3 * b3
    dotProduct (Vector4 a1 a2 a3 a4) (Vector4 b1 b2 b3 b4) = a1 * b1 + a2 * b2 + a3 * b3 + a4 * b4

    instance Num a => Num (Vector a) where
        (+) = liftM2 (+)
        (-) = liftM2 (-)
        (*) = dotProduct
        negate      = fmap negate
        abs         = fmap abs
        signum      = fmap signum
        fromInteger = pure . fromInteger
