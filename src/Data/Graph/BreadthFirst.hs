module Data.Graph.BreadthFirst (search) where

import qualified Data.Map as M
import qualified Data.Graph.Example as E
import Data.Misc

search :: M.Map E.From E.Dests -> E.Route
search field = _search acc _field
    where
        nexts   = case M.lookup E.Start field of
                      Just v  -> v
                      Nothing -> []
        initacc = layerup $ replicate (length nexts) E.Start
        acc     = zipPrepend nexts initacc
        _field  = M.delete E.Start field

_search :: [E.Route] -> M.Map E.From E.Dests -> E.Route
_search [] _ = []
_search acc field = case E.flagGoal acc of
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
                        _field = E.remove heads field

