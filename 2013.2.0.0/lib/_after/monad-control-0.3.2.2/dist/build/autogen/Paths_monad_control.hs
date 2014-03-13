module Paths_monad_control (
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
version = Version {versionBranch = [0,3,2,2], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "D:\\case\\Haskell\\2013.2.0.0\\lib\\extralibs\\bin"
libdir     = "D:\\case\\Haskell\\2013.2.0.0\\lib\\extralibs\\monad-control-0.3.2.2\\ghc-7.6.3"
datadir    = "D:\\case\\Haskell\\2013.2.0.0\\lib\\extralibs\\monad-control-0.3.2.2"
libexecdir = "D:\\case\\Haskell\\2013.2.0.0\\lib\\extralibs\\monad-control-0.3.2.2"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "monad_control_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "monad_control_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "monad_control_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "monad_control_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
