module Shape () where
    data Point = Point Float Float deriving (Show)
    data Shape = Circle Point Float | Rectangle Point Point deriving (Show)

    area :: Shape -> Float
    area (Circle _ r)                            = pi * r * r
    area (Rectangle (Point x1 y1) (Point x2 y2)) = abs $ (x1 - x2) * (y1 - y2)

    move :: Shape -> Float -> Float -> Shape
    move (Circle (Point x y) r) a b = Circle (Point (x + a) (y + b)) r
    area (Rectangle (Point x1 y1) (Point x2 y2)) a b = Rectangle (Point (x1 + a) (y1 + b)) (Point (x2 + a) (y2 + b))

    unitCircle :: Float -> Circle
    unitCircle = Circle (Point 0 0)

    baseRectangle :: Float -> Float -> Rectangle
    baseRectangle a b = Rectangle (Point 0 0)
