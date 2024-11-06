type Optional a = (a, Bool)

-- (>=>) :: (a -> optional b) -> (b -> optional c) -> (a -> optional c)
-- f >=> g = \x ->
--   let (y, v1) = f x
--       (z, v2) = g y
--   in (z, v1 && v2)

return :: a -> Optional a
return x | x == () = ((), False)
         | x /= () = (x, True) 

-- Examples
-- safe_root :: Int -> Optional Int
-- safe_root = 
