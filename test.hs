main = do
    print(sum (takeWhile
                (<10000)
                [x^2 | x<-[1..], odd x])
          ==
          sum (takeWhile
                (<10000)
                (map (^2) (filter odd [1..]))))
