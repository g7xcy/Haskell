module BST (BST.elem, find, insert) where
    -- data BST a = Empty | Node a {leftSubTree :: BST a, rightSubTree :: BST a} deriving (Eq, Show)
    data BST a = Empty | Node a (BST a) (BST a) deriving (Eq, Show)

    insert :: (Ord a) => BST a -> a -> BST a
    insert Empty x = Node x Empty Empty
    insert tree@(Node a leftSubTree rightSubTree) x
        | x == a = tree
        | x < a  = Node a (insert leftSubTree x) rightSubTree
        | x > a  = Node a leftSubTree (insert rightSubTree x)

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
