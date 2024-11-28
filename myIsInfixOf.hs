import Data.List (any, isPrefixOf, tails)

myIsInfixOf :: (Eq a) => [a] -> [a] -> Bool
myIsInfixOf _ [] = False
myIsInfixOf [] _ = True
myIsInfixOf xs ys = any (isPrefixOf xs) (tails ys)

main = do
  print (myIsInfixOf [1 .. 10] [2 .. 5])
  print (myIsInfixOf [3 .. 5] [1 .. 11])
  print (myIsInfixOf "llo W" "Hello World")
