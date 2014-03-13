{-# LANGUAGE OverloadedStrings #-}

import Prelude hiding (putStrLn)
import Data.ByteString.Char8
import Data.Text.ICU.Convert

main :: IO ()
main = do
    conv <- open enc (Just False)
    putStrLn (fromUnicode conv "さんぷる")

  where
    enc = "Windows-31J"
