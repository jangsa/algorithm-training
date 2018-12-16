module Lib
    ( run
    ) where

import qualified Data.Graph.DepthFirst as DF
import qualified Data.Graph.BreadthFirst as BF
import qualified Data.Graph.Example as E

run :: IO ()
run = do
    putStrLn . show $ DF.search E.Start [] E.maze
    putStrLn . show $ BF.search E.maze

