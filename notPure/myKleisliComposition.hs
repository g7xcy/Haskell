import System.IO

myKleisliComposition :: (Monad m) => (b -> m c) -> (a -> m b) -> a -> m c
myKleisliComposition f g x = g x >>= f

-- lines :: String -> [String]
-- unlines :: [String] -> String
-- filter :: (a -> Bool) -> [a] -> [a]
-- unlines . (filter p . lines) :: String -> String
filterShortString :: String -> IO String
filterShortString = pure . unlines . filter (\x -> length x < 40) . lines

-- hGetContents :: Handle -> IO String
-- filterShortString :: String -> IO String
-- (hGetContents >=> filterShortString) :: Handle -> IO String
getShortString :: Handle -> IO String
getShortString = myKleisliComposition filterShortString hGetContents

-- putStrLn :: String -> IO ()
-- getShortString :: Handle -> IO String
putShortStrLn :: Handle -> IO ()
putShortStrLn = myKleisliComposition putStrLn getShortString

main =
  withFile
    "/Users/I584533/personal_workspace/Haskell/notPure/Sonnet106.txt"
    ReadMode
    putShortStrLn
