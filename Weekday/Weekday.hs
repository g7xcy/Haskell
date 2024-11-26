data Weekday = Monday | Tuesday | Wednesday | Thursday | Friday | Satuarday | Sunday deriving (Bounded, Enum, Eq, Ord, Read, Show)

main = do
    print(Monday == Monday)
    print(Monday > Tuesday)
    print(Wednesday > Tuesday)
    print(minBound :: Weekday)
    print(maxBound :: Weekday)
    print(succ Thursday)
    print(pred Sunday)
