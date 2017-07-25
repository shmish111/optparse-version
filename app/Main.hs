module Main where

import Options.Applicative.Version
import Options.Applicative
import Data.Monoid ((<>))

main :: IO ()
main = do
  execParser $ info (version <**> helper) (fullDesc <> progDesc "example")
  return ()
