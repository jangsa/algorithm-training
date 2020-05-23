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
_search accRoutes field = case flagGoal accRoutes of
                        answer@(x:xs)    -> reverse answer
                        _ | M.null field -> []
                        _                -> _search _accRoutes _field
                    where
                        heads = head <$> accRoutes
                        tails = tail <$> accRoutes
                        horizFilter = \h -> \t ->
                          case M.lookup h field of
                              Just v -> filter (not . flip exists t) v
                              _      -> []

                        nextss = zipWith horizFilter heads tails
                        _accRoutes =
                          (nextss `zip` accRoutes) >>=
                            (\(nexts, a) -> zipPrepend nexts $ replicate (length nexts) a)
                        _field = remove field heads

