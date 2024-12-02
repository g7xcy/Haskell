splitOn :: (Eq a) => a -> [a] -> ([a], [a])
splitOn _ [] = ([], [])
splitOn a (x:xs)
  | x == a = ([], xs)
  | otherwise =
    let (left, right) = splitOn a xs
     in (x : left, right)

main = do
  putStrLn "What's your name?"
  name <- getLine
  let (firstName, lastName) = splitOn ' ' name
  print $ "First name is: " ++ firstName
  print $ "Last name is: " ++ lastName
