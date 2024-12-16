import Control.Exception (bracket)
import Control.Monad ((>=>))
import System.IO

myWithFile :: FilePath -> IOMode -> (Handle -> IO a) -> IO a
myWithFile path mode = bracket (openFile path mode) hClose

-- >=> :: (Monad m) => (a -> M b) -> (b -> M c) -> a -> M c
-- <=< :: (Monad m) => (b -> M c) -> (a -> M b) -> a -> M c
-- hGetContents :: Handle -> IO String
-- putStrLn :: String -> IO ()
-- hGetContents >=> putStrLn :: Handle -> IO ()
-- putStrLn <=< hGetContents :: Handle -> IO ()
main = do
  myWithFile
    "/Users/I584533/personal_workspace/Haskell/notPure/Sonnet106.txt"
    ReadMode
    (hGetContents >=> putStrLn)

-- bracket (openFile "/Users/I584533/personal_workspace/Haskell/notPure/Sonnet106.txt" ReadMode) hClose (hGetContents >=> putStrLn)
