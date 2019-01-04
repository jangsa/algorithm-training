module Data.Graph.Helper where

import qualified Data.Map as M
import qualified Data.Misc as MSC

data Vertex = Start | Goal | Vertex Int deriving (Show, Eq, Ord)
type From = Vertex
type Dest = Vertex
type Dests = [Dest]
type Route = [Dest]

remove :: M.Map Vertex Dests -> Dests -> M.Map Vertex Dests
remove = foldl $ flip M.delete

flagGoal :: [Route] -> Route
flagGoal [] = []
flagGoal (xs:xss)
    | MSC.exists Goal xs = xs
    | otherwise = flagGoal xss

