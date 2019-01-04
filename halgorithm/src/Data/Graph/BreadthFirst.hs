module Data.Graph.BreadthFirst (search) where

import qualified Data.Map as M
import Data.Graph.Helper
import Data.Misc

search :: M.Map From Dests -> Vertex -> Route
search field start = _search acc _field
    where
        nexts   = case M.lookup start field of
                      Just v  -> v
                      Nothing -> []
        initacc = layerup $ replicate (length nexts) start
        acc     = zipPrepend nexts initacc
        _field  = M.delete start field

_search :: [Route] -> M.Map From Dests -> Route
_search [] _ = []
_search acc field = case flagGoal acc of
                        answer@(x:xs)    -> reverse answer
                        _ | M.null field -> []
                        _                -> _search _acc _field
                    where
                        heads = head `map` acc
                        tails = tail `map` acc
                        nextss = (\(h, t) -> case M.lookup h field of
                                                 Just v -> filter (not . flip exists t) v
                                                 _ -> []
                                 ) `map` (heads `zip` tails)
                        _acc = (nextss `zip` acc) >>=
                            (\(nexts, a) -> zipPrepend nexts $ replicate (length nexts) a)
                        _field = remove field heads

