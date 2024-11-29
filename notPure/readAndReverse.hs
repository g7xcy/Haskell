import Control.Monad (unless)

reverseWords :: String -> String
reverseWords = unwords . map reverse . words

readAndReverse :: IO ()
readAndReverse = do
    line <- getLine
    unless (null line) $ do
        print $ reverseWords line
        readAndReverse


main :: IO ()
main = readAndReverse


  -- line <- getLine
  -- if null line
  --   then return ()
  --   else do
  --     print $ reverseWords line
  --     readAndReverse