my_flip :: (a -> b -> c) -> (b -> a -> c)
-- my_flip f = g
--     where g x y = f y x
my_flip f y x = f x y

f :: a -> a -> a
f x y = x

main = do
    putStrLn(
        show(
            f 1 2))
    putStrLn(
        show(
            (my_flip f) 1 2))
