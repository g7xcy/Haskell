-- pure a >>= f = f a
-- (M a) >>= pure == (M a)
main =
  do
    pure "What is your name?"
    -- >>= print
    -- >> getLine
    -- >>= \n -> pure ("Hello, " ++ n) >>= (\n -> print n)
    >>= print
    >> getLine
    >>= \n -> print ("Hello, " ++ n)
