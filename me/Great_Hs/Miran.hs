{-# LANGUAGE OverloadedStrings, ViewPatterns #-}

import qualified Data.Text as T
import qualified Data.Text.IO as T

main :: IO ()
main = do
    yourWorry <- T.getLine
    T.putStrLn $ encourage yourWorry 
    main

isNegative :: Char -> Bool
isNegative = (`elem` "不無未")

encourage :: T.Text -> T.Text
encourage (T.uncons -> Just ((isNegative -> True), xs)) -- encourage (x:xs) ...とは出来ないが、ViewPatternsによりこの記述で代用できる
    = T.append xs "!!"
encourage xs = xs    
