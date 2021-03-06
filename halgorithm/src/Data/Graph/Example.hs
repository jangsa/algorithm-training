module Data.Graph.Example where

import qualified Data.Map as M
import Data.Graph.Helper

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

