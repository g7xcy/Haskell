import           Data.List (tails)
myInits :: [a] -> [[a]]
myInits = reverse . map reverse . tails . reverse

main = do
    print(myInits "abc")
    print(myInits [1..5])
