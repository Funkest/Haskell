module Paths_transformers_base (
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
version = Version {versionBranch = [0,4,1], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "D:\\case\\Haskell\\2013.2.0.0\\lib\\extralibs\\bin"
libdir     = "D:\\case\\Haskell\\2013.2.0.0\\lib\\extralibs\\transformers-base-0.4.1\\ghc-7.6.3"
datadir    = "D:\\case\\Haskell\\2013.2.0.0\\lib\\extralibs\\transformers-base-0.4.1"
libexecdir = "D:\\case\\Haskell\\2013.2.0.0\\lib\\extralibs\\transformers-base-0.4.1"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "transformers_base_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "transformers_base_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "transformers_base_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "transformers_base_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
