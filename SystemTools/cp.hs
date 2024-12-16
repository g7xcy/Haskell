import Control.Exception (bracketOnError)
import Control.Monad ((>=>))
import qualified Data.ByteString.Lazy as B
import System.Directory (doesFileExist, removeFile, renameFile)
import System.Environment (getArgs)
import System.IO (Handle, hClose, hPutStrLn, openTempFile)

-- B.readFile :: FilePath -> IO B.ByteString
-- handler :: Handle
-- B.hPutStr :: Handle -> B.ByteString -> IO ()
-- B.hPutStr handler :: B.ByteString -> IO ()
-- B.readFile >=> B.hPutStr handler :: FilePath -> IO ()
-- unless Applicative f => Bool -> f () -> f ()
copy :: FilePath -> FilePath -> IO ()
copy sourcePath targetPath = do
  fileExists <- doesFileExist sourcePath
  if not fileExists
    then putStrLn ("File " ++ sourcePath ++ " doesn't exist.")
    else
      bracketOnError
        (openTempFile "." "temp")
        closeTempFile
        ( \(tempPath, handler) -> do
            (B.readFile >=> B.hPutStr handler) sourcePath
            hClose handler
            renameFile tempPath targetPath
        )

closeTempFile :: (FilePath, Handle) -> IO ()
closeTempFile (tempPath, handler) = do
  hClose handler
  removeFile tempPath

main = do
  (sourcePath : targetPath : _) <- getArgs
  copy sourcePath targetPath
