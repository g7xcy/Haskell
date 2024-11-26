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

main = do
    print(insert Empty 1)
    let tree = insert (insert (insert (insert (insert (insert (insert (insert (insert Empty 1) 0) 2) 10) 0) 9) 4) 7) 5
    print tree 
    print $ find tree 1
    print $ find tree 11
    print $ find tree 10
    print $ find tree 5
    print $ find tree 8
