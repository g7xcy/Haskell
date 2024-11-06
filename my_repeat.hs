my_repeat :: a -> [a]
my_repeat x = x : my_repeat x

main = do
    putStrLn( show( my_take 4 ( my_repeat 1)))
