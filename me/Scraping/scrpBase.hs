-- scrpBase.hs
import System.IO (readFile)
import Network.HTTP
import Text.HTML.TagSoup
import Text.HTML.TagSoup.Tree
import Data.Char (isSpace)
import qualified Codec.Binary.UTF8.String as U

-- Scrape
openURL :: String -> IO String
openURL x = getResponseBody =<< simpleHTTP (getRequest x)

-- Remove spaces
trim :: String -> String
trim = f . f
    where f = reverse . dropWhile isSpace

getSchools :: IO [[String]]
getSchools = do
    tags <- fmap parseTags $ openURL "http://en.wikipedia.org/wiki/Database_cinema"
    let tree = tagTree tags
    let schools = map doCell_2 (init $ drop 2 $ [x | (TagBranch "div" _ x) <- universeTree tree])
    return schools
    where
        doCell :: [TagTree String] -> [String]
        --doCell xs = [U.decodeString $ trim $ fromTagText t | t@(TagText _) <- flattenTree xs]
        doCell xs = [trim $ fromTagText t | t@(TagText _) <- flattenTree xs]
        doRow :: [TagTree String] -> [[String]]
        doRow xs = map doCell [x | (TagBranch "td" _ x) <- xs]
       
        -- Added by me
        doCell_2 :: [TagTree String] -> [String]
        doCell_2 xs = map (snd . head . filter ((== "id") . fst)) [attr | (TagBranch _ attr _) <- xs]
