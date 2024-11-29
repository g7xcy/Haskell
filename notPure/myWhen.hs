myWhen :: Bool -> IO () -> IO ()
myWhen False _ = return ()
myWhen True io = io

main = do
  myWhen False $ print "Hi False"
  myWhen True $ print "Hi True"
  line <- getLine
  myWhen ((==) line "Greeting") $ do
    putStrLn "What's your name?"
    name <- getLine
    putStrLn $ "Hello, " ++ name
