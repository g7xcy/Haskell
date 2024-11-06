first :: (a, b, c) -> a
second :: (a, b, c) -> b
third :: (a, b, c) -> c

first (a, _, _) = a
second (_, a, _) = a
third (_, _, a) = a

main = do
    putStrLn(show(first (1, 2.0, '3')))
    putStrLn(show(second (1, 2.0, '3')))
    putStrLn(show(third (1, 2.0, '3')))
