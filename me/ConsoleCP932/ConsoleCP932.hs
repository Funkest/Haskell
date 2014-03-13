{-# LANGUAGE OverloadedStrings #-}

import System.IO (stdin, stdout)
import Data.Text
import Data.Conduit
import Data.Conduit.Binary
import Data.Conduit.Text.Multiplatform

-- "quit"が入力されるまで、入力テキストに"★★"を付加して出力します
exampleConduit :: Monad m => Conduit Text m Text
exampleConduit = loop
  where
    loop = await >>= maybe (return ()) go

    go t = do
        case t of
            "quit" -> return ()
            _      ->
                do
                    yield $ "★★" `append` t `append` "\n"
                    loop


main :: IO ()
main = do
    runResourceT $
        sourceHandle stdin
            $= decodeByICU inEnc
            $= linesCRLF
            $= exampleConduit
            $$ encodeByICU outEnc
            =$ sinkHandle stdout

  where
    inEnc  = "utf-8"
    outEnc = "Windows-31J"

--like... .\ConsoleCP932.exe < .\temp.txt
--  or... Get-Content .\temp.txt .\ConsoleCP932.exe ,but this occurs ★★???.
