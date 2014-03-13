module Paths_semigroups (
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
version = Version {versionBranch = [0,12,1], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "D:\\case\\Haskell\\2013.2.0.0\\lib\\extralibs\\bin"
libdir     = "D:\\case\\Haskell\\2013.2.0.0\\lib\\extralibs\\semigroups-0.12.1\\ghc-7.6.3"
datadir    = "D:\\case\\Haskell\\2013.2.0.0\\lib\\extralibs\\semigroups-0.12.1"
libexecdir = "D:\\case\\Haskell\\2013.2.0.0\\lib\\extralibs\\semigroups-0.12.1"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "semigroups_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "semigroups_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "semigroups_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "semigroups_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)