import qualified Data.ByteString.Lazy as B

main = do
  print $ B.pack [97 .. 122]
  mapM_ print ((B.unpack . B.pack) [97 .. 122])
