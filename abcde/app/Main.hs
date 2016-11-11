module Main where

import Lib

main :: IO ()
main = do
  l <- getLine
  src <- readFile l
  putStrLn src

