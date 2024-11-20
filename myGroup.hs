import           Data.List (groupBy)
myGroup :: Eq a => [a] -> [[a]]
myGroup = groupBy (==)

main = do
    print(myGroup [1, 2, 2, 2, 2, 3, 3, 4, 4, 4, 5, 6, 6])
