_my_foldl :: (a -> b -> b) -> b -> [a] -> b
_my_foldl _ acc [] = acc
_my_foldl f acc (x:xs) = _my_foldl f (f x acc) xs

my_foldr :: (a -> b -> b) -> b -> [a] -> b
my_foldr f acc xs = _my_foldl f acc (reverse xs)

main = do
    putStrLn(show(my_foldr (/) 2 [8,12,24,4]))
    putStrLn(show(_my_foldl (/) 2 [8,12,24,4]))