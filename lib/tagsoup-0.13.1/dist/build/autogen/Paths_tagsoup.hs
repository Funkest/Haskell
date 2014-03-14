module Paths_tagsoup (
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
version = Version {versionBranch = [0,13,1], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "D:\\case\\Haskell\\2013.2.0.0\\lib\\extralibs\\bin"
libdir     = "D:\\case\\Haskell\\2013.2.0.0\\lib\\extralibs\\tagsoup-0.13.1\\ghc-7.6.3"
datadir    = "D:\\case\\Haskell\\2013.2.0.0\\lib\\extralibs\\tagsoup-0.13.1"
libexecdir = "D:\\case\\Haskell\\2013.2.0.0\\lib\\extralibs\\tagsoup-0.13.1"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "tagsoup_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "tagsoup_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "tagsoup_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "tagsoup_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
