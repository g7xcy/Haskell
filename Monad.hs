pure :: a -> Monad a
bind :: (a -> Monad b) -> Monad a -> Monad b