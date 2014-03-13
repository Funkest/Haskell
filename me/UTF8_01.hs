module Unicode where
import System.IO

main = do
    h <- openFile "d:/temp/test.txt" WriteMode
    hSetEncoding h utf8
    hPutStrLn h "テスト"
    hClose h
--http://itpro.nikkeibp.co.jp/article/COLUMN/20100406/346695/?P=5    
