{-# LANGUAGE OverloadedStrings #-}
import Data.Text as T
import Data.Text.IO as IT

main :: IO()
main = do    
    print "What is your name?"      :: IO ()
    name <- IT.getLine              :: IO Text
--    print ("Hello " ++ name ++ "!") :: IO ()
    T.print (name) :: IO ()
    _    <- IT.getLine              :: IO Text
    return ()                       :: IO ()
