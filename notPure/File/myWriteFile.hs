import System.IO

myWriteFile :: FilePath -> String -> IO ()
myWriteFile path contents = withFile path WriteMode (flip hPutStr contents)
