{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE OverloadedStrings #-}
module Lib where

import NeatInterpolation
import Data.Text (pack, unpack, Text)
import Data.Maybe (isJust, fromMaybe)

sourcify :: Text -> Text
sourcify program = [text|
  data = []
  dp = 0
  $program
|]

expression :: Char -> String
expression c
  | c == '>' = "dp += 1"
  | c == '<' = "dp -= 1"
  | c == '+' = "data[dp] = data[dp].to_i + 1"
  | c == '-' = "data[dp] = data[dp].to_i - 1"
  | c == '.' = "puts data[dp].to_i.chr"
  | c == ',' = "data[dp] = gets.bytes.first"
  | c == '[' = "while data[dp].to_i != 0 do"
  | c == ']' = "end"
  | otherwise  = ""

compile :: String -> String
compile str = unpack $ sourcify $ pack $ unlines $ filter (/= "") $ map expression str
