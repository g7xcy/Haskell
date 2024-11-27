module BST (BST.elem, find, insert) where
    -- data BST a = Empty | Node a {leftSubTree :: BST a, rightSubTree :: BST a} deriving (Eq, Show)
    data BST a = Empty | Node a (BST a) (BST a) deriving (Eq, Show)

    instance Functor BST where
        fmap :: (a -> b) -> BST a -> BST b
        fmap _ Empty = Empty
        fmap f (Node a leftSubTree rightSubTree) = Node (f a) (fmap f leftSubTree) (fmap f rightSubTree)

    insert :: (Ord a) => BST a -> a -> BST a
    insert Empty x = Node x Empty Empty
    insert tree@(Node a leftSubTree rightSubTree) x
        | x == a = tree
        | x < a  = Node a (insert leftSubTree x) rightSubTree
        | x > a  = Node a leftSubTree (insert rightSubTree x)

    toList :: BST a -> [a]
    toList Empty = []
    toList (Node a leftSubTree rightSubTree) = a : toList leftSubTree ++ toList rightSubTree

    find :: (Ord a) => BST a -> a -> Maybe a
    find Empty _ = Nothing
    find tree@(Node a leftSubTree rightSubTree) x
        | x == a = Just a
        | x < a  = find leftSubTree x
        | x > a  = find rightSubTree x

    elem :: (Ord a) => BST a -> a -> Bool
    elem Empty _ = False
    elem tree@(Node a leftSubTree rightSubTree) x
        | x == a = True
        | x < a  = BST.elem leftSubTree x
        | x > a  = BST.elem rightSubTree x
