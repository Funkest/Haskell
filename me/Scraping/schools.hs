-- schools.hs
import System.IO (readFile)
import Network.HTTP
import Text.HTML.TagSoup
import Text.HTML.TagSoup.Tree
import Data.Char (isSpace)
import qualified Codec.Binary.UTF8.String as U

path = "D:\\case\\Haskell\\me\\Scraping"
-- Scrape
openURL :: String -> IO String
openURL x = getResponseBody =<< simpleHTTP (getRequest x)

-- |先頭と末尾の空白を取り除く
trim :: String -> String
trim = f . f
    where f = reverse . dropWhile isSpace

main = showSchools

getSchools :: IO [[[String]]]
getSchools = do
    tags <- fmap parseTags $ openURL "http://www.city.funabashi.chiba.jp/kodomo/school/0004/p008678.html"
--    tags <- fmap parseTags $ readFile $ path ++ "\\funabashi.html"
    -- 木構造を取得
    let tree = tagTree tags
    -- tr を取り出す (先頭2つと末尾は除く)
    let schools = map doRow (init $ drop 2 $ [x | (TagBranch "tr" _ x) <- universeTree tree])
    return schools
    where
        -- |セルの文字列を取り出す
        doCell :: [TagTree String] -> [String]
        --doCell xs = [U.decodeString $ trim $ fromTagText t | t@(TagText _) <- flattenTree xs]
        --もともとlinux(console encoding = UTF8)で出力するためのソースだったが、
        --Windowsのconsole出力は難儀なのでファイル出力に変更
        --すると上記decodeが災いするようになった
        doCell xs = [trim $ fromTagText t | t@(TagText _) <- flattenTree xs]

        -- |td を取り出す
        doRow :: [TagTree String] -> [[String]]
        doRow xs = map doCell [x | (TagBranch "td" _ x) <- xs]

showSchools = do
    s <- getSchools
    mapM doSchool s
    return ()
    where
        doSchool xs = do
            -- インデックス1の要素(学校名)を取り出す
            let sname = head $ xs !! 1
--            putStr (sname ++ "\n")
            appendFile (path ++ "\\temp.txt") (sname ++ "\n")
            -- 残りを表示
--            putStr ((show $ drop 2 xs) ++ "\n")
            appendFile (path ++ "\\temp.txt") ((show $ drop 2 xs) ++ "\n")
