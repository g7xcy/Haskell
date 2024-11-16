applyTwice :: (a -> a) -> a -> a
applyTwice f a = f( f a)

main = do
    print(applyTwice (+ 7) 2)
