{-# LANGUAGE OverloadedStrings #-}

import System.IO (stdout)
import Data.ByteString (ByteString)
import Data.Text
import Data.Conduit
import Data.Conduit.Binary
import Data.Text.ICU.Convert
import Control.Monad.Trans

encodeByICU :: MonadIO m => String -> Conduit Text m ByteString
encodeByICU name = do
    conv <- liftIO $ open name (Just False)
    loop conv

  where
    loop conv = await >>= maybe (return ()) (go conv)

    go conv t = do
        yield $ fromUnicode conv t
        loop conv

main :: IO ()
main = do
    runResourceT $
        yield (Data.Text.pack $ show ticket) $$ encodeByICU enc =$ sinkHandle stdout
  where
    enc = "Windows-31J"
-----------------------------------------------------------------------
ticket :: Ticket
ticket = Ticket "abcde12345" "fgh" "ijk" (Time 10 20) (Time 14 30)

data Ticket = Ticket {flight :: String, from :: String, to :: String,
                      start :: Time, arrive :: Time}

instance Show Ticket where
    show t = "便名: " ++ flight t ++ '\n':"出発空港コード: " ++ from t ++
        '\n':"到着空港コード: " ++ to t ++ '\n':"出発時間: " ++ (show $ start t) ++
        '\n':"到着時間: " ++ (show $ arrive t)

data Time = Time {hour :: Int, minute :: Int}

instance Show Time where
    show t = (show $ hour t) ++ "時" ++ (show $ minute t) ++ "分"
