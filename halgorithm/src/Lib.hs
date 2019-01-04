module Lib
    ( run
    ) where

import qualified Data.Graph.DepthFirst as DF
import qualified Data.Graph.BreadthFirst as BF
import qualified Data.Graph.Example as E
import qualified Data.Graph.Helper as H

run :: IO ()
run = do
    putStrLn . show $ DF.search E.maze H.Start 
    putStrLn . show $ BF.search E.maze H.Start

