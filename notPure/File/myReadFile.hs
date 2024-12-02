import System.IO

myReadFile :: FilePath -> IO String
myReadFile path = openFile path ReadMode >>= hGetContents
