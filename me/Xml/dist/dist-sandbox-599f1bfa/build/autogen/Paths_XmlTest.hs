module Paths_XmlTest (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "D:\\case\\Haskell\\me\\Xml\\.cabal-sandbox\\bin"
libdir     = "D:\\case\\Haskell\\me\\Xml\\.cabal-sandbox\\i386-windows-ghc-7.6.3\\XmlTest-0.1.0.0"
datadir    = "D:\\case\\Haskell\\me\\Xml\\.cabal-sandbox\\i386-windows-ghc-7.6.3\\XmlTest-0.1.0.0"
libexecdir = "D:\\case\\Haskell\\me\\Xml\\.cabal-sandbox\\XmlTest-0.1.0.0"
sysconfdir = "D:\\case\\Haskell\\me\\Xml\\.cabal-sandbox\\etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "XmlTest_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "XmlTest_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "XmlTest_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "XmlTest_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "XmlTest_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
