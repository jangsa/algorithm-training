module Data.Misc (exists, layerup, zipPrepend, distinct) where

-- check if the first arg exists in the second list arg
exists :: Eq a => a -> [a] -> Bool
exists _ [] = False
exists k (x:xs)
    | k == x    = True
    | otherwise = exists k xs

-- increase list layer with each element
layerup :: [a] -> [[a]]
layerup = _layerup []

_layerup :: [[a]] -> [a] -> [[a]]
_layerup acc [] = acc -- no need to reverse coz all same
_layerup acc (x:xs) = _layerup ([x]:acc) xs

-- prepend each head of the first list arg to head of the sencond list arg
zipPrepend :: [a] -> [[a]] -> [[a]]
zipPrepend x y = map (\(a,b) -> a : b) $ x `zip` y

distinct :: Eq a => [a] -> [a]
distinct xs = _distinct [] xs

_distinct :: Eq a => [a] -> [a] -> [a]
_distinct acc [] = reverse acc
_distinct acc (x:xs) = _distinct (x:acc) (filter (/=x) xs)

