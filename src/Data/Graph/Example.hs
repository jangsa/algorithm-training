module Data.Graph.Example where

import qualified Data.Map as M
import qualified Data.Misc as MSC

data Vertex = Start | Goal | Vertex Int deriving (Show, Eq, Ord)
type From = Vertex
type Dest = Vertex
type Dests = [Dest]
type Route = [Dest]

remove :: Dests -> M.Map Vertex Dests -> M.Map Vertex Dests
remove [] fd = fd
remove (h:t) fd = remove t (M.delete h fd)

flagGoal :: [Route] -> Route
flagGoal [] = []
flagGoal (xs:xss)
    | MSC.exists Goal xs = xs
    | otherwise = flagGoal xss

maze :: M.Map From Dests
maze =  M.fromList [
               (Start,     [Vertex 1,  Vertex 6,  Vertex 8 ]),
               (Vertex 1,  [Start,     Vertex 2,  Vertex 3 ]),
               (Vertex 2,  [Vertex 1,  Vertex 10, Vertex 11]),
               (Vertex 3,  [Vertex 1,  Vertex 4,  Vertex 12]),
               (Vertex 4,  [Vertex 3,  Vertex 5,  Vertex 13]),
               (Vertex 5,  [Vertex 4,  Vertex 6,  Vertex 9 ]),
               (Vertex 6,  [Start,     Vertex 5,  Vertex 7 ]),
               (Vertex 7,  [Vertex 6,  Vertex 8,  Vertex 9 ]),
               (Vertex 8,  [Start,     Vertex 7,  Vertex 14]),
               (Vertex 9,  [Vertex 5,  Vertex 7,  Goal     ]),
               (Vertex 10, [Vertex 2]),
               (Vertex 11, [Vertex 2]),
               (Vertex 12, [Vertex 3]),
               (Vertex 13, [Vertex 4]),
               (Vertex 14, [Vertex 8])
        ]

