module Main where

import Lib

main :: IO ()
main = putStrLn =<< (compile <$> getContents)
