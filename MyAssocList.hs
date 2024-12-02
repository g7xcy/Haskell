module MyAssocList
  ( assocList
  , findKey
  ) where

type AssocList k v = [(k, v)]

assocList :: k -> v -> AssocList k v
assocList k v = [(k, v)]

findKey :: (Eq k) => k -> AssocList k v -> Maybe v
findKey k =
  foldr
    (\(a, b) acc ->
       if a == k
         then Just b
         else acc)
    Nothing
