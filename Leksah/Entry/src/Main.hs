-- Main.hs
import System.IO (readFile)
import Network.HTTP
import Text.HTML.TagSoup
import Text.HTML.TagSoup.Tree
import Data.Char (isSpace)
import qualified Codec.Binary.UTF8.String as U

-- Scrape
openURL :: String -> IO String
openURL x = getResponseBody =<< simpleHTTP (getRequest x)

-- Remove spaces --今日から
trim :: String -> String
trim = f . f
    where f = reverse . dropWhile isSpace

main = do
    tags <- fmap parseTags $ openURL "http://www.city.funabashi.chiba.jp/kodomo/school/0004/p008678.html"
    print "jj"



