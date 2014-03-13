module Paths_conduit (
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
version = Version {versionBranch = [1,0,9,3], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "D:\\case\\Haskell\\2013.2.0.0\\lib\\extralibs\\bin"
libdir     = "D:\\case\\Haskell\\2013.2.0.0\\lib\\extralibs\\conduit-1.0.9.3\\ghc-7.6.3"
datadir    = "D:\\case\\Haskell\\2013.2.0.0\\lib\\extralibs\\conduit-1.0.9.3"
libexecdir = "D:\\case\\Haskell\\2013.2.0.0\\lib\\extralibs\\conduit-1.0.9.3"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "conduit_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "conduit_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "conduit_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "conduit_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
