import Data.Char (chr, ord)

encode :: Int -> [Char] -> [Char]
encode n = map (chr . (+ n) . ord)

decode :: Int -> [Char] -> [Char]
decode n = encode (negate n)

main = do
  print (encode 1 "Hello World")
  print (decode 1 "Ifmmp!Xpsme")
  print (encode 1 [])
