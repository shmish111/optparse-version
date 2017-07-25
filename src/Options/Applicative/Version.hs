module Options.Applicative.Version where

import Options.Applicative
import Data.Char (isSpace)
import Data.List (dropWhileEnd)

trim :: String -> String
trim = dropWhileEnd isSpace . dropWhile isSpace

version :: String -> Parser (a -> a)
version versionStr = abortOption (InfoMsg (trim versionStr)) $ mconcat
  [ long "version"
  , short 'v'
  , help "Show the version"
  , hidden
  ]
