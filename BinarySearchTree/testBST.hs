import BST

main = do
  let tree = foldr (flip insert) Empty [2, 8, 4, 5, 1, 1, 6, 9, 0, 3]
  print tree
  print $ find tree 1
  print $ BST.elem tree 5
