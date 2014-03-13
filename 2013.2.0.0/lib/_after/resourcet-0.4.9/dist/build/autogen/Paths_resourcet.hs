module Paths_resourcet (
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
version = Version {versionBranch = [0,4,9], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "D:\\case\\Haskell\\2013.2.0.0\\lib\\extralibs\\bin"
libdir     = "D:\\case\\Haskell\\2013.2.0.0\\lib\\extralibs\\resourcet-0.4.9\\ghc-7.6.3"
datadir    = "D:\\case\\Haskell\\2013.2.0.0\\lib\\extralibs\\resourcet-0.4.9"
libexecdir = "D:\\case\\Haskell\\2013.2.0.0\\lib\\extralibs\\resourcet-0.4.9"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "resourcet_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "resourcet_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "resourcet_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "resourcet_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
