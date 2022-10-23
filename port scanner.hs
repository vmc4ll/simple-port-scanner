>>> :{
aa2u "++  +-----+  +--+--+-----+  \n\
     \++  +--+  |  |  |  |     |  \n\
     \       |  |  +--+--+--+--+  \n\
     \+---+  |  |  |     |  |  |  \n\
     \+---+  +--+  +-----+--+--+  "
:}
module Main (main) where

import Control.Concurrent
import Control.Exception
import Data.Maybe
import Network
import Network.BSD
import System.Environment
import System.Exit
import System.IO

main :: IO ()
main = do
    args <- getArgs
    case args of
        [host, from, to] -> withSocketsDo $
                            scanRange host [read from .. read to]
        _                -> usage

