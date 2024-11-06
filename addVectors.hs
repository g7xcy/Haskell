addVectors :: Num a => (a, a) -> (a, a) -> (a, a)
addVectors (x1, y1) (x2, y2) = (x1+x2, y1+y2)

main = do
    putStrLn (show (addVectors (1, 2) (3, 4)))
