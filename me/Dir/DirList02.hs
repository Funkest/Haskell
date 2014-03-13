--import Data.String.Utils
import Control.Monad
import Data.List
import System.Directory
import System.FilePath.Windows

listFilesR     :: FilePath -> IO [FilePath]
writeFilePaths :: String -> [FilePath] -> IO ()

main = getCurrentDirectory >>= listFilesR >>= (writeFilePaths "d:/temp/test.txt")

writeFilePaths file fPaths = do
--Works    writeFile file $ foldl (\x y -> x ++ "\n" ++ y) (head fPaths) $ tail fPaths
    createDirectoryIfMissing True $ takeDirectory file
    writeFile file $ intercalate "\n" fPaths

listFilesR path = let
    isDODD       :: String -> Bool
    isDODD f     = not $ (isSuffixOf "." f) || (isSuffixOf ".." f)  -- Unix "/.", "/.."

    listDirs     :: [FilePath] -> IO [FilePath]
    listDirs     = filterM doesDirectoryExist

    listFiles    :: [FilePath] -> IO [FilePath]
    listFiles    = filterM doesFileExist

    joinFN       :: String -> String -> FilePath
    joinFN p1 p2 = joinPath [p1, p2]

    in do
        allfiles    <- getDirectoryContents path
        no_dots     <- filterM (return . isDODD) (map (joinFN path) allfiles)
        dirs        <- listDirs no_dots
        subdirfiles <- (mapM listFilesR dirs >>= return . concat)
        files       <- listFiles no_dots
        return $ files ++ subdirfiles

{--
 - Prelude D M DL> getDirectoryContents "d:/temp" >>= filterM (\x -> return $ not $ (isSuffixOf "." x) || (isSuffixOf ".." x))
 を実行すると期待通りのリストが表示される

--}

