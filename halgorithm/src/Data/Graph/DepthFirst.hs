module Data.Graph.DepthFirst where

import qualified Data.Map as M
import Data.Graph.Helper
import Data.Misc (exists)

search :: M.Map From Dests -> Vertex -> Route
search field start = _search start [] field

_search :: From -> Route -> M.Map From Dests -> Route
_search _ _ field | M.null field = []
_search curr acc field
    | curr == Goal         = reverse (curr:acc)
    | isDeadEnd || isCleared = backtrack acc
    | otherwise              = case lookup of
                                   Just (nexth:nextt) ->
                                       _search nexth _acc _field
                                       where
                                           _acc   = curr : acc
                                           _field = M.update (\x -> Just nextt) curr field
                                   _                  -> backtrack acc
    where
        lookup         = M.lookup curr field
        isDeadEnd      = lookup == Nothing
        isCleared      = exists curr acc
        backtrack acc_ = case acc_ of
                             (prevh:prevt) -> _search prevh prevt field
                             _             -> []

