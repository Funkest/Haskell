{-# LINE 1 "Data\Text\ICU\Collate.hsc" #-}
{-# LANGUAGE CPP, DeriveDataTypeable, ForeignFunctionInterface #-}
{-# LINE 2 "Data\Text\ICU\Collate.hsc" #-}
-- |
-- Module      : Data.Text.ICU.Collate
-- Copyright   : (c) 2010 Bryan O'Sullivan
--
-- License     : BSD-style
-- Maintainer  : bos@serpentine.com
-- Stability   : experimental
-- Portability : GHC
--
-- String collation functions for Unicode, implemented as bindings to
-- the International Components for Unicode (ICU) libraries.

module Data.Text.ICU.Collate
    (
    -- * Unicode collation API
    -- $api
    -- * Types
      MCollator
    , Attribute(..)
    , AlternateHandling(..)
    , CaseFirst(..)
    , Strength(..)
    -- * Functions
    , open
    , collate
    , collateIter
    -- ** Utility functions
    , equals
    , getAttribute
    , setAttribute
    , sortKey
    , clone
    , freeze
    ) where


{-# LINE 38 "Data\Text\ICU\Collate.hsc" #-}

import Data.ByteString (empty)
import Data.ByteString.Internal (ByteString(..), create, mallocByteString,
                                 memcpy)
import Data.Int (Int32)
import Data.Text (Text)
import qualified Data.Text as T
import Data.Text.Foreign (useAsPtr)
import Data.Text.ICU.Collate.Internal (Collator(..), MCollator, UCollator,
                                       equals, withCollator, wrap)
import Data.Text.ICU.Error.Internal (UErrorCode, handleError)
import Data.Text.ICU.Internal
    (LocaleName, UChar, CharIterator, UCharIterator,
     asOrdering, withCharIterator, withLocaleName)
import Data.Typeable (Typeable)
import Data.Word (Word8)
import Foreign.C.String (CString)
import Foreign.C.Types (CInt(..))
import Foreign.ForeignPtr (withForeignPtr)
import Foreign.Marshal.Utils (with)
import Foreign.Ptr (Ptr, nullPtr)

-- $api
--

-- | Control the handling of variable weight elements.
data AlternateHandling = NonIgnorable
                       -- ^ Treat all codepoints with non-ignorable primary
                       -- weights in the same way.
                       | Shifted
                         -- ^ Cause codepoints with primary weights that are
                         -- equal to or below the variable top value to be
                         -- ignored on primary level and moved to the
                         -- quaternary level.
                         deriving (Eq, Bounded, Enum, Show, Typeable)

-- | Control the ordering of upper and lower case letters.
data CaseFirst = UpperFirst     -- ^ Force upper case letters to sort before
                                -- lower case.
               | LowerFirst     -- ^ Force lower case letters to sort before
                                -- upper case.
                deriving (Eq, Bounded, Enum, Show, Typeable)

-- | The strength attribute. The usual strength for most locales (except
-- Japanese) is tertiary. Quaternary strength is useful when combined with
-- shifted setting for alternate handling attribute and for JIS x 4061
-- collation, when it is used to distinguish between Katakana and Hiragana
-- (this is achieved by setting 'HiraganaQuaternaryMode' mode to
-- 'True'). Otherwise, quaternary level is affected only by the number of
-- non ignorable code points in the string. Identical strength is rarely
-- useful, as it amounts to codepoints of the 'NFD' form of the string.
data Strength = Primary
              | Secondary
              | Tertiary
              | Quaternary
              | Identical
                deriving (Eq, Bounded, Enum, Show, Typeable)

data Attribute = French Bool
               -- ^ Direction of secondary weights, used in French.  'True',
               -- results in secondary weights being considered backwards,
               -- while 'False' treats secondary weights in the order in
               -- which they appear.
               | AlternateHandling AlternateHandling
                 -- ^ For handling variable elements.  'NonIgnorable' is
                 -- default.
               | CaseFirst (Maybe CaseFirst)
               -- ^ Control the ordering of upper and lower case letters.
               -- 'Nothing' (the default) orders upper and lower case
               -- letters in accordance to their tertiary weights.
               | CaseLevel Bool
                 -- ^ Controls whether an extra case level (positioned
                 -- before the third level) is generated or not.  When
                 -- 'False' (default), case level is not generated; when
                 -- 'True', the case level is generated. Contents of the
                 -- case level are affected by the value of the 'CaseFirst'
                 -- attribute. A simple way to ignore accent differences in
                 -- a string is to set the strength to 'Primary' and enable
                 -- case level.
               | NormalizationMode Bool
               -- ^ Controls whether the normalization check and necessary
               -- normalizations are performed. When 'False' (default) no
               -- normalization check is performed. The correctness of the
               -- result is guaranteed only if the input data is in
               -- so-called 'FCD' form (see users manual for more info).
               -- When 'True', an incremental check is performed to see
               -- whether the input data is in 'FCD' form. If the data is
               -- not in 'FCD' form, incremental 'NFD' normalization is
               -- performed.
               | Strength Strength
               | HiraganaQuaternaryMode Bool
                 -- ^ When turned on, this attribute positions Hiragana
                 -- before all non-ignorables on quaternary level. This is a
                 -- sneaky way to produce JIS sort order.
               | Numeric Bool
                 -- ^ When enabled, this attribute generates a collation key
                 -- for the numeric value of substrings of digits.  This is
                 -- a way to get '100' to sort /after/ '2'.
                 deriving (Eq, Show, Typeable)

type UColAttribute = CInt
type UColAttributeValue = CInt

toUAttribute :: Attribute -> (UColAttribute, UColAttributeValue)
toUAttribute (French v)
    = ((0), toOO v)
{-# LINE 144 "Data\Text\ICU\Collate.hsc" #-}
toUAttribute (AlternateHandling v)
    = ((1), toAH v)
{-# LINE 146 "Data\Text\ICU\Collate.hsc" #-}
toUAttribute (CaseFirst v)
    = ((2), toCF v)
{-# LINE 148 "Data\Text\ICU\Collate.hsc" #-}
toUAttribute (CaseLevel v)
    = ((3), toOO v)
{-# LINE 150 "Data\Text\ICU\Collate.hsc" #-}
toUAttribute (NormalizationMode v)
    = ((4), toOO v)
{-# LINE 152 "Data\Text\ICU\Collate.hsc" #-}
toUAttribute (Strength v)
    = ((5), toS v)
{-# LINE 154 "Data\Text\ICU\Collate.hsc" #-}
toUAttribute (HiraganaQuaternaryMode v)
    = ((6), toOO v)
{-# LINE 156 "Data\Text\ICU\Collate.hsc" #-}
toUAttribute (Numeric v)
    = ((7), toOO v)
{-# LINE 158 "Data\Text\ICU\Collate.hsc" #-}

toOO :: Bool -> UColAttributeValue
toOO False = 16
{-# LINE 161 "Data\Text\ICU\Collate.hsc" #-}
toOO True  = 17
{-# LINE 162 "Data\Text\ICU\Collate.hsc" #-}

toAH :: AlternateHandling -> UColAttributeValue
toAH NonIgnorable = 21
{-# LINE 165 "Data\Text\ICU\Collate.hsc" #-}
toAH Shifted      = 20
{-# LINE 166 "Data\Text\ICU\Collate.hsc" #-}

toCF :: Maybe CaseFirst -> UColAttributeValue
toCF Nothing           = 16
{-# LINE 169 "Data\Text\ICU\Collate.hsc" #-}
toCF (Just UpperFirst) = 25
{-# LINE 170 "Data\Text\ICU\Collate.hsc" #-}
toCF (Just LowerFirst) = 24
{-# LINE 171 "Data\Text\ICU\Collate.hsc" #-}

toS :: Strength -> UColAttributeValue
toS Primary    = 0
{-# LINE 174 "Data\Text\ICU\Collate.hsc" #-}
toS Secondary  = 1
{-# LINE 175 "Data\Text\ICU\Collate.hsc" #-}
toS Tertiary   = 2
{-# LINE 176 "Data\Text\ICU\Collate.hsc" #-}
toS Quaternary = 3
{-# LINE 177 "Data\Text\ICU\Collate.hsc" #-}
toS Identical  = 15
{-# LINE 178 "Data\Text\ICU\Collate.hsc" #-}

fromOO :: UColAttributeValue -> Bool
fromOO (16) = False
{-# LINE 181 "Data\Text\ICU\Collate.hsc" #-}
fromOO (17)  = True
{-# LINE 182 "Data\Text\ICU\Collate.hsc" #-}
fromOO bad = valueError "fromOO" bad

fromAH :: UColAttributeValue -> AlternateHandling
fromAH (21) = NonIgnorable
{-# LINE 186 "Data\Text\ICU\Collate.hsc" #-}
fromAH (20)       = Shifted
{-# LINE 187 "Data\Text\ICU\Collate.hsc" #-}
fromAH bad = valueError "fromAH" bad

fromCF :: UColAttributeValue -> Maybe CaseFirst
fromCF (16)         = Nothing
{-# LINE 191 "Data\Text\ICU\Collate.hsc" #-}
fromCF (25) = Just UpperFirst
{-# LINE 192 "Data\Text\ICU\Collate.hsc" #-}
fromCF (24) = Just LowerFirst
{-# LINE 193 "Data\Text\ICU\Collate.hsc" #-}
fromCF bad = valueError "fromCF" bad

fromS :: UColAttributeValue -> Strength
fromS (0)    = Primary
{-# LINE 197 "Data\Text\ICU\Collate.hsc" #-}
fromS (1)  = Secondary
{-# LINE 198 "Data\Text\ICU\Collate.hsc" #-}
fromS (2)   = Tertiary
{-# LINE 199 "Data\Text\ICU\Collate.hsc" #-}
fromS (3) = Quaternary
{-# LINE 200 "Data\Text\ICU\Collate.hsc" #-}
fromS (15)  = Identical
{-# LINE 201 "Data\Text\ICU\Collate.hsc" #-}
fromS bad = valueError "fromS" bad

fromUAttribute :: UColAttribute -> UColAttributeValue -> Attribute
fromUAttribute key val =
  case key of
    (0)         -> French (fromOO val)
{-# LINE 207 "Data\Text\ICU\Collate.hsc" #-}
    (1)       -> AlternateHandling (fromAH val)
{-# LINE 208 "Data\Text\ICU\Collate.hsc" #-}
    (2)               -> CaseFirst (fromCF val)
{-# LINE 209 "Data\Text\ICU\Collate.hsc" #-}
    (3)               -> CaseLevel (fromOO val)
{-# LINE 210 "Data\Text\ICU\Collate.hsc" #-}
    (4)       -> NormalizationMode (fromOO val)
{-# LINE 211 "Data\Text\ICU\Collate.hsc" #-}
    (5)                 -> Strength (fromS val)
{-# LINE 212 "Data\Text\ICU\Collate.hsc" #-}
    (6) -> HiraganaQuaternaryMode (fromOO val)
{-# LINE 213 "Data\Text\ICU\Collate.hsc" #-}
    (7)        -> Numeric (fromOO val)
{-# LINE 214 "Data\Text\ICU\Collate.hsc" #-}
    _ -> valueError "fromUAttribute" key

valueError :: Show a => String -> a -> z
valueError func bad = error ("Data.Text.ICU.Collate.IO." ++ func ++
                             ": invalid value " ++ show bad)

type UCollationResult = CInt

-- | Open a 'Collator' for comparing strings.
open :: LocaleName
     -- ^ The locale containing the required collation rules.
     -> IO MCollator
open loc = wrap =<< withLocaleName loc (handleError . ucol_open)

-- | Set the value of an 'MCollator' attribute.
setAttribute :: MCollator -> Attribute -> IO ()
setAttribute c a =
  withCollator c $ \cptr ->
    handleError $ uncurry (ucol_setAttribute cptr) (toUAttribute a)

-- | Get the value of an 'MCollator' attribute.
--
-- It is safe to provide a dummy argument to an 'Attribute' constructor when
-- using this function, so the following will work:
--
-- > getAttribute mcol (NormalizationMode undefined)
getAttribute :: MCollator -> Attribute -> IO Attribute
getAttribute c a = do
  let name = fst (toUAttribute a)
  val <- withCollator c $ \cptr -> handleError $ ucol_getAttribute cptr name
  return $! fromUAttribute name val

-- | Compare two strings.
collate :: MCollator -> Text -> Text -> IO Ordering
collate c a b =
  withCollator c $ \cptr ->
    useAsPtr a $ \aptr alen ->
      useAsPtr b $ \bptr blen ->
        fmap asOrdering . handleError $
        ucol_strcoll cptr aptr (fromIntegral alen) bptr (fromIntegral blen)

-- | Compare two 'CharIterator's.
--
-- If either iterator was constructed from a 'ByteString', it does not need
-- to be copied or converted internally, so this function can be quite
-- cheap.
collateIter :: MCollator -> CharIterator -> CharIterator -> IO Ordering
collateIter c a b =
  fmap asOrdering . withCollator c $ \cptr ->
    withCharIterator a $ \ai ->
      withCharIterator b $ handleError . ucol_strcollIter cptr ai

-- | Create a key for sorting the 'Text' using the given 'Collator'.
-- The result of comparing two 'ByteString's that have been
-- transformed with 'sortKey' will be the same as the result of
-- 'collate' on the two untransformed 'Text's.
sortKey :: MCollator -> Text -> IO ByteString
sortKey c t
    | T.null t = return empty
    | otherwise = do
  withCollator c $ \cptr ->
    useAsPtr t $ \tptr tlen -> do
      let len = fromIntegral tlen
          loop n = do
            fp <- mallocByteString (fromIntegral n)
            i <- withForeignPtr fp $ \p -> ucol_getSortKey cptr tptr len p n
            let j = fromIntegral i
            case undefined of
              _ | i == 0         -> error "Data.Text.ICU.Collate.IO.sortKey: internal error"
                | i > n          -> loop i
                | i <= n `div` 2 -> create j $ \p -> withForeignPtr fp $ \op ->
                                    memcpy p op (fromIntegral i)
                | otherwise      -> return $! PS fp 0 j
      loop (min (len * 4) 8)

-- | Make a safe copy of a mutable 'MCollator' for use in pure code.
-- Subsequent changes to the 'MCollator' will not affect the state of
-- the returned 'Collator'.
freeze :: MCollator -> IO Collator
freeze = fmap C . clone

-- | Make a copy of a mutable 'MCollator'.
-- Subsequent changes to the input 'MCollator' will not affect the state of
-- the returned 'MCollator'.
clone :: MCollator -> IO MCollator
clone c = do
  p <- withCollator c $ \cptr ->
    with (1)
{-# LINE 302 "Data\Text\ICU\Collate.hsc" #-}
      (handleError . ucol_safeClone cptr nullPtr)
  wrap p

foreign import ccall unsafe "hs_text_icu.h __hs_ucol_open" ucol_open
    :: CString -> Ptr UErrorCode -> IO (Ptr UCollator)

foreign import ccall unsafe "hs_text_icu.h __hs_ucol_getAttribute" ucol_getAttribute
    :: Ptr UCollator -> UColAttribute -> Ptr UErrorCode -> IO UColAttributeValue

foreign import ccall unsafe "hs_text_icu.h __hs_ucol_setAttribute" ucol_setAttribute
    :: Ptr UCollator -> UColAttribute -> UColAttributeValue -> Ptr UErrorCode -> IO ()

foreign import ccall unsafe "hs_text_icu.h __hs_ucol_strcoll" ucol_strcoll
    :: Ptr UCollator -> Ptr UChar -> Int32 -> Ptr UChar -> Int32
    -> Ptr UErrorCode -> IO UCollationResult

foreign import ccall unsafe "hs_text_icu.h __hs_ucol_getSortKey" ucol_getSortKey
    :: Ptr UCollator -> Ptr UChar -> Int32 -> Ptr Word8 -> Int32
    -> IO Int32

foreign import ccall unsafe "hs_text_icu.h __hs_ucol_strcollIter" ucol_strcollIter
    :: Ptr UCollator -> Ptr UCharIterator -> Ptr UCharIterator -> Ptr UErrorCode
    -> IO UCollationResult

foreign import ccall unsafe "hs_text_icu.h __hs_ucol_safeClone" ucol_safeClone
        :: Ptr UCollator -> Ptr a -> Ptr Int32 -> Ptr UErrorCode
        -> IO (Ptr UCollator)
