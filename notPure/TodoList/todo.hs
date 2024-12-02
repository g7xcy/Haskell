import Control.Exception (bracketOnError)
import Control.Monad ((>=>))
import Data.List (delete, lookup)
import Data.Maybe (fromMaybe)
import System.Directory (removeFile, renameFile)
import System.Environment (getArgs)
import System.IO (Handle, appendFile, hClose, hPutStrLn, openTempFile, readFile)

type Command = String

type Args = [String]

-- Map commands to their corresponding functions
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

-- Display help information
help :: Args -> IO ()
help [] =
  mapM_
    putStrLn
    [ "Usage: add <filePath> <content>"
    , "Usage: bump <filePath> <index>"
    , "Usage: view <filePath>"
    , "Usage: remove <filePath> <index>"
    ]
help ["add"] = putStrLn "Usage: add <filePath> <content>"
help ["bump"] = putStrLn "Usage: bump <filePath> <index>"
help ["view"] = putStrLn "Usage: view <filePath>"
help ["remove"] = putStrLn "Usage: remove <filePath> <index>"

-- Add an item to the todo list
add :: Args -> IO ()
add [path, content] = appendFile path (content ++ "\n")
add _ = help ["add"]

-- Move an item to the top of the todo list
bump :: Args -> IO ()
bump [path, index] = do
  rawTodoItems <- readTodoItems path
  let indexInt = read index - 1
      selectedItem = rawTodoItems !! indexInt
      newTodoList = selectedItem : removeAtIndex indexInt rawTodoItems
  withTempFile (writeTodoItems path newTodoList)
bump _ = help ["bump"]

-- View the todo list
view :: Args -> IO ()
view [path] = do
  rawTodoItems <- readTodoItems path
  mapM_ putStrLn
    $ zipWith (\index item -> show index ++ " - " ++ item) [1 ..] rawTodoItems
view _ = putStrLn "Usage: view <filePath>"

-- Remove an item from the todo list
remove :: Args -> IO ()
remove [path, index] = do
  rawTodoItems <- readTodoItems path
  let newTodoList = removeAtIndex (read index - 1) rawTodoItems
  withTempFile (writeTodoItems path newTodoList)
remove _ = putStrLn "Usage: remove <filePath> <index>"

-- Create a temporary file, perform an action, and handle exceptions
withTempFile :: ((FilePath, Handle) -> IO ()) -> IO ()
withTempFile = bracketOnError (openTempFile "." "temp") cleanupTempFile

-- Read all lines from a file
readTodoItems :: FilePath -> IO [String]
readTodoItems = fmap lines . readFile

-- Remove a temporary file created by openTempFile
cleanupTempFile :: (FilePath, Handle) -> IO ()
cleanupTempFile (tempPath, handler) = hClose handler >> removeFile tempPath

-- Write new todo items to a file
writeTodoItems :: String -> [String] -> (FilePath, Handle) -> IO ()
writeTodoItems path contents (tempPath, handler) = do
  mapM_ (hPutStrLn handler) contents
  hClose handler
  removeFile path
  renameFile tempPath path

-- Remove an item at a specific index from a list
removeAtIndex :: Int -> [a] -> [a]
removeAtIndex i xs =
  let (before, after) = splitAt i xs
   in before ++ drop 1 after

-- Main function to get command line arguments and dispatch commands
main :: IO ()
main = do
  (command:args) <- getArgs
  dispatch command args
