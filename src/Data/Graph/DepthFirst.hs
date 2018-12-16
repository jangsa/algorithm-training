module Data.Graph.DepthFirst where

import qualified Data.Map as M
import qualified Data.Graph.Example as E
import Data.Misc (exists)

search :: E.From -> E.Route -> M.Map E.From E.Dests -> E.Route
search _ _ field | M.null field = []
search curr acc field
    | curr == E.Goal         = reverse (curr:acc)
    | isDeadEnd || isCleared = backtrack acc
    | otherwise              = case lookup of
                                   Just (nexth:nextt) ->
                                       search nexth _acc _field
                                       where
                                           _acc   = curr : acc
                                           _field = M.update (\x -> Just nextt) curr field
                                   _                  -> backtrack acc
    where
        lookup         = M.lookup curr field
        isDeadEnd      = lookup == Nothing
        isCleared      = exists curr acc
        backtrack acc_ = case acc_ of
                             (prevh:prevt) -> search prevh prevt field
                             _             -> []

