{-# LANGUAGE TemplateHaskell #-}
module Main where

import Options.Applicative.Version
import Options.Applicative
import Data.Monoid ((<>))
import Data.FileEmbed (embedStringFile)

versionStr :: String
versionStr = trim $(embedStringFile "version.txt")

main :: IO ()
main = do
  execParser $ info (version versionStr <**> helper) (fullDesc <> progDesc "example")
  return ()
