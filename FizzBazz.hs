main = do
  let fizz_bazz 15 = "FizzBazz"
  let fizz_bazz 3 = "Fizz"
  let fizz_bazz 5 = "Bazz"
  let fizz_bazz x = fizz_bazz (mod x 15)
  putStrLn (fizz_bazz 1)
