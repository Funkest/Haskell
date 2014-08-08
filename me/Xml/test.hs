import Text.XML.HXT.Core
import Text.XML.HXT.Arrow.XmlArrow
import Control.Arrow

main :: IO ()
main = do
  runX (readDocument [] "test.html"
        >>>
        chapterToH1
        >>>
        writeDocument [] "result.html"
        )
  return ()
