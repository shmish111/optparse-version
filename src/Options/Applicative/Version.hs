{-# LANGUAGE TemplateHaskell #-}
module Options.Applicative.Version where

import Data.FileEmbed (embedStringFile)
import Options.Applicative
import Data.Char (isSpace)
import Data.List (dropWhileEnd)

trim :: String -> String
trim = dropWhileEnd isSpace . dropWhile isSpace

versionStr :: String
versionStr = trim $(embedStringFile "version.txt")

version :: Parser (a -> a)
version = abortOption (InfoMsg versionStr) $ mconcat
  [ long "version"
  , short 'v'
  , help "Show the version"
  , hidden
  ]
