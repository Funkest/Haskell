{-# LINE 1 "System\Win32File.hsc" #-}
{-# LANGUAGE ForeignFunctionInterface #-}
{-# LINE 2 "System\Win32File.hsc" #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
module System.Win32File
    ( openRead
    , read
    , close
    ) where

import Foreign.C.String (CString)
import Foreign.Ptr (castPtr)
import Foreign.Marshal.Alloc (mallocBytes, free)
import Foreign.ForeignPtr       (ForeignPtr, withForeignPtr)

{-# LINE 14 "System\Win32File.hsc" #-}
import Foreign.C.Types (CInt (..))

{-# LINE 18 "System\Win32File.hsc" #-}
import Foreign.C.Error (throwErrnoIfMinus1Retry)
import Foreign.Ptr (Ptr)
import Data.Bits (Bits, (.|.))
import qualified Data.ByteString as S
import qualified Data.ByteString.Unsafe as BU
import qualified Data.ByteString.Internal as BI
import Data.Text (pack)
import Data.Text.Encoding (encodeUtf16LE)
import Data.Word (Word8)
import Prelude hiding (read)
import GHC.ForeignPtr           (mallocPlainForeignPtrBytes)



{-# LINE 32 "System\Win32File.hsc" #-}

{-# LINE 33 "System\Win32File.hsc" #-}

{-# LINE 34 "System\Win32File.hsc" #-}

{-# LINE 35 "System\Win32File.hsc" #-}

newtype OFlag = OFlag CInt
    deriving (Num, Bits, Show, Eq)

oBinary  :: OFlag
oBinary  = OFlag 32768
oRdonly  :: OFlag
oRdonly  = OFlag 0
oWronly  :: OFlag
oWronly  = OFlag 1
oCreat   :: OFlag
oCreat   = OFlag 256

{-# LINE 45 "System\Win32File.hsc" #-}

newtype SHFlag = SHFlag CInt
    deriving (Num, Bits, Show, Eq)

shDenyno  :: SHFlag
shDenyno  = SHFlag 64

{-# LINE 52 "System\Win32File.hsc" #-}

newtype PMode = PMode CInt
    deriving (Num, Bits, Show, Eq)

pIread  :: PMode
pIread  = PMode 256
pIwrite  :: PMode
pIwrite  = PMode 128

{-# LINE 60 "System\Win32File.hsc" #-}

foreign import ccall "_wsopen"
    c_wsopen :: CString -> OFlag -> SHFlag -> PMode -> IO CInt

foreign import ccall "_read"
    c_read :: FD -> Ptr Word8 -> CInt -> IO CInt

foreign import ccall "_write"
    c_write :: FD -> Ptr Word8 -> CInt -> IO CInt

foreign import ccall "_close"
    close :: FD -> IO ()

newtype FD = FD CInt

openRead :: FilePath -> IO FD
openRead fp = do
    -- need to append a null char
    -- note that useAsCString is not sufficient, as we need to have two
    -- null octets to account for UTF16 encoding
    let bs = encodeUtf16LE $ pack $ fp ++ "\0"
    h <- BU.unsafeUseAsCString bs $ \str ->
            throwErrnoIfMinus1Retry "System.Win32File.openRead" $
            c_wsopen
                str
                (oBinary .|. oRdonly)
                shDenyno
                pIread
    return $ FD h

read :: FD -> IO (Maybe S.ByteString)
read fd = do
    fp <- mallocPlainForeignPtrBytes 4096
    withForeignPtr fp $ \p -> do
        len <- throwErrnoIfMinus1Retry "System.Win32File.read" $ c_read fd p 4096
        if len == 0
            then return $! Nothing
            else return $! Just $! BI.PS fp 0 (fromIntegral len)
