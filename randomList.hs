import System.Random

main = do
    let x = take 100 $ randomRs (-100, 100) (mkStdGen 1000) :: [Int]
    print x