data Weekday = Monday | Tuesday | Wednesday | Thursday | Friday | Satuarday | Sunday deriving (Bounded, Enum, Ord, Read, Show)

instance Eq Weekday where
  Monday == Monday = True
  Tuesday == Tuesday = True
  Wednesday == Wednesday = True
  Thursday == Thursday = True
  Friday == Friday = True
  Satuarday == Satuarday = True
  Sunday == Sunday = True
  _ == _ = False

main = do
  print (Monday == Monday)
  print (Sunday == Sunday)
  print (Sunday == Monday)
  print (Monday > Tuesday)
  print (Wednesday > Tuesday)
  print (minBound :: Weekday)
  print (maxBound :: Weekday)
  print (succ Thursday)
  print (pred Sunday)
