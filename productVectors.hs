vec_product :: Num a => (a, a) -> (a, a) -> a
vec_product (x1, y1) (x2, y2) = x1*x2 + y1*y2

main = do
    putStrLn (show (vec_product (1, 3) (2, 4)))
