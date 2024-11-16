applyTwice :: (a -> a) -> a -> a
applyTwice f a = f( f a)

main = do
    putStrLn( show( applyTwice (+ 7) 2))