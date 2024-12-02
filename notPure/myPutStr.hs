myPutStr :: String -> IO ()
myPutStr [] = return ()
myPutStr (c:xs) = do
  putChar c
  myPutStr xs

myPutStrLn :: String -> IO ()
myPutStrLn xs = do
  myPutStr xs
  putChar '\n'

main = do
  myPutStr "Hello "
  myPutStr "World"
  putChar '\n'
  myPutStrLn "Hello "
  myPutStrLn "World"
