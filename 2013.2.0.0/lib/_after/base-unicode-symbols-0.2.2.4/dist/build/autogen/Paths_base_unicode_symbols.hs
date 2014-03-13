module Paths_base_unicode_symbols (
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
version = Version {versionBranch = [0,2,2,4], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "D:\\case\\Haskell\\2013.2.0.0\\lib\\extralibs\\bin"
libdir     = "D:\\case\\Haskell\\2013.2.0.0\\lib\\extralibs\\base-unicode-symbols-0.2.2.4\\ghc-7.6.3"
datadir    = "D:\\case\\Haskell\\2013.2.0.0\\lib\\extralibs\\base-unicode-symbols-0.2.2.4"
libexecdir = "D:\\case\\Haskell\\2013.2.0.0\\lib\\extralibs\\base-unicode-symbols-0.2.2.4"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "base_unicode_symbols_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "base_unicode_symbols_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "base_unicode_symbols_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "base_unicode_symbols_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
