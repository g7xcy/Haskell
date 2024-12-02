import Control.Exception (bracketOnError)
import Control.Monad ((>=>))
import Data.List (delete, lookup)
import Data.Maybe (fromMaybe)
import System.Directory (removeFile, renameFile)
import System.Environment (getArgs)
import System.IO (Handle, appendFile, hClose, hPutStrLn, openTempFile, readFile)

type Command = String

type Args = [String]

-- map commands to functions
dispatch :: Command -> Args -> IO ()
dispatch command = fromMaybe unknownCommand (lookup command commands)
  where
    commands =
      [ ("--add", add)
      , ("-a", add)
      , ("--bump", bump)
      , ("-b", bump)
      , ("--view", view)
      , ("-v", view)
      , ("--remove", remove)
      , ("-r", remove)
      , ("--help", help)
      , ("-h", help)
      , ("-?", help)
      ]
    unknownCommand =
      const
        $ putStrLn
            ("Unknown command: "
               ++ command
               ++ ". Use '--help' for a list of available commands.")

-- show help list
help :: Args -> IO ()
help [] =
  mapM_
    putStrLn
    [ "Usage: add <filePath> <content>"
    , "Usage: view <filePath>"
    , "Usage: remove <filePath> <index>"
    ]
help ["add"] = putStrLn "Usage: add <filePath> <content>"
help ["bump"] = putStrLn "Usage: bump <filePath> <index>"
help ["view"] = putStrLn "Usage: view <filePath>"
help ["remove"] = putStrLn "Usage: remove <filePath> <index>"

-- add item into todo list
add :: Args -> IO ()
add [path, content] = appendFile path (content ++ "\n")
add _ = help ["add"]

-- bump an item to the top
bump :: Args -> IO ()
bump [path, index] = do
  rawTodoItems <- readRawTodoItems path
  bracketOnError
    (openTempFile "." "temp")
    cleanupTempFile
    (\(tempPath, handler) -> do
       let selectedItem = rawTodoItems !! (read index - 1)
       mapM_
         (hPutStrLn handler)
         (selectedItem : delete selectedItem rawTodoItems)
       hClose handler
       removeFile path
       renameFile tempPath path)
bump _ = help ["bump"]

-- view todo list
view :: Args -> IO ()
view [path] = do
  -- rawTodoItems <- (readFile >=> pure . lines) path
  rawTodoItems <- readRawTodoItems path
  mapM_ putStrLn
    $ zipWith (\index item -> show index ++ " - " ++ item) [1 ..] rawTodoItems
view _ = putStrLn "Usage: view <filePath>"

-- remove item of todo list
remove :: Args -> IO ()
remove [path, index] = do
  rawTodoItems <- readRawTodoItems path
  bracketOnError
    (openTempFile "." "temp")
    cleanupTempFile
    (\(tempPath, handler) -> do
       mapM_
         (hPutStrLn handler)
         (delete (rawTodoItems !! (read index - 1)) rawTodoItems)
       hClose handler
       removeFile path
       renameFile tempPath path)
remove _ = putStrLn "Usage: remove <filePath> <index>"

-- read all contents, may affect performance
readRawTodoItems :: FilePath -> IO [String]
readRawTodoItems = fmap lines . readFile

-- remove temp file created by openTempFile
cleanupTempFile :: (FilePath, Handle) -> IO ()
cleanupTempFile (tempPath, handler) = hClose handler >> removeFile tempPath

main = do
  (command:args) <- getArgs
  dispatch command args
