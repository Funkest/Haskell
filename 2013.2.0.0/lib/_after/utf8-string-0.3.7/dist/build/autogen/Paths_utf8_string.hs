module Paths_utf8_string (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,3,7], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "D:\\case\\Haskell\\2013.2.0.0\\lib\\extralibs\\bin"
libdir     = "D:\\case\\Haskell\\2013.2.0.0\\lib\\extralibs\\utf8-string-0.3.7\\ghc-7.6.3"
datadir    = "D:\\case\\Haskell\\2013.2.0.0\\lib\\extralibs\\utf8-string-0.3.7"
libexecdir = "D:\\case\\Haskell\\2013.2.0.0\\lib\\extralibs\\utf8-string-0.3.7"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "utf8_string_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "utf8_string_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "utf8_string_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "utf8_string_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
