{-# OPTIONS_GHC -optc-DU_HAVE_INTTYPES_H=1 #-}
{-# LINE 1 "Data\Text\ICU\Error.hsc" #-}
-- |
{-# LINE 2 "Data\Text\ICU\Error.hsc" #-}
-- Module      : Data.Text.ICU.Error
-- Copyright   : (c) 2010 Bryan O'Sullivan
--
-- License     : BSD-style
-- Maintainer  : bos@serpentine.com
-- Stability   : experimental
-- Portability : GHC
--
-- Errors thrown by bindings to the International Components for
-- Unicode (ICU) libraries.
--
-- Most ICU functions can throw an 'ICUError' value as an exception.
-- Some can additionally throw a 'ParseError', if more detailed error
-- information is necessary.
module Data.Text.ICU.Error
    (
     -- * Types
     ICUError,
     ParseError(errError, errLine, errOffset),

     -- * Functions
     isSuccess,
     isFailure,
     errorName,
     isRegexError,

     -- * Warnings
     u_USING_FALLBACK_WARNING,
     u_USING_DEFAULT_WARNING,
     u_SAFECLONE_ALLOCATED_WARNING,
     u_STATE_OLD_WARNING,
     u_STRING_NOT_TERMINATED_WARNING,
     u_SORT_KEY_TOO_SHORT_WARNING,
     u_AMBIGUOUS_ALIAS_WARNING,
     u_DIFFERENT_UCA_VERSION,

     -- * Errors
     u_ILLEGAL_ARGUMENT_ERROR,
     u_MISSING_RESOURCE_ERROR,
     u_INVALID_FORMAT_ERROR,
     u_FILE_ACCESS_ERROR,
     u_INTERNAL_PROGRAM_ERROR,
     u_MESSAGE_PARSE_ERROR,
     u_MEMORY_ALLOCATION_ERROR,
     u_INDEX_OUTOFBOUNDS_ERROR,
     u_PARSE_ERROR,
     u_INVALID_CHAR_FOUND,
     u_TRUNCATED_CHAR_FOUND,
     u_ILLEGAL_CHAR_FOUND,
     u_INVALID_TABLE_FORMAT,
     u_INVALID_TABLE_FILE,
     u_BUFFER_OVERFLOW_ERROR,
     u_UNSUPPORTED_ERROR,
     u_RESOURCE_TYPE_MISMATCH,
     u_ILLEGAL_ESCAPE_SEQUENCE,
     u_UNSUPPORTED_ESCAPE_SEQUENCE,
     u_NO_SPACE_AVAILABLE,
     u_CE_NOT_FOUND_ERROR,
     u_PRIMARY_TOO_LONG_ERROR,
     u_STATE_TOO_OLD_ERROR,
     u_TOO_MANY_ALIASES_ERROR,
     u_ENUM_OUT_OF_SYNC_ERROR,
     u_INVARIANT_CONVERSION_ERROR,
     u_INVALID_STATE_ERROR,
     u_COLLATOR_VERSION_MISMATCH,
     u_USELESS_COLLATOR_ERROR,
     u_NO_WRITE_PERMISSION,

     -- ** Transliterator errors
     u_BAD_VARIABLE_DEFINITION,
     u_MALFORMED_RULE,
     u_MALFORMED_SET,
     u_MALFORMED_UNICODE_ESCAPE,
     u_MALFORMED_VARIABLE_DEFINITION,
     u_MALFORMED_VARIABLE_REFERENCE,
     u_MISPLACED_CURSOR_OFFSET,
     u_MISPLACED_QUANTIFIER,
     u_MISSING_OPERATOR,
     u_MULTIPLE_ANTE_CONTEXTS,
     u_MULTIPLE_CURSORS,
     u_MULTIPLE_POST_CONTEXTS,
     u_TRAILING_BACKSLASH,
     u_UNDEFINED_SEGMENT_REFERENCE,
     u_UNDEFINED_VARIABLE,
     u_UNQUOTED_SPECIAL,
     u_UNTERMINATED_QUOTE,
     u_RULE_MASK_ERROR,
     u_MISPLACED_COMPOUND_FILTER,
     u_MULTIPLE_COMPOUND_FILTERS,
     u_INVALID_RBT_SYNTAX,
     u_MALFORMED_PRAGMA,
     u_UNCLOSED_SEGMENT,
     u_VARIABLE_RANGE_EXHAUSTED,
     u_VARIABLE_RANGE_OVERLAP,
     u_ILLEGAL_CHARACTER,
     u_INTERNAL_TRANSLITERATOR_ERROR,
     u_INVALID_ID,
     u_INVALID_FUNCTION,

     -- ** Formatting API parsing errors
     u_UNEXPECTED_TOKEN,
     u_MULTIPLE_DECIMAL_SEPARATORS,
     u_MULTIPLE_EXPONENTIAL_SYMBOLS,
     u_MALFORMED_EXPONENTIAL_PATTERN,
     u_MULTIPLE_PERCENT_SYMBOLS,
     u_MULTIPLE_PERMILL_SYMBOLS,
     u_MULTIPLE_PAD_SPECIFIERS,
     u_PATTERN_SYNTAX_ERROR,
     u_ILLEGAL_PAD_POSITION,
     u_UNMATCHED_BRACES,
     u_ARGUMENT_TYPE_MISMATCH,
     u_DUPLICATE_KEYWORD,
     u_UNDEFINED_KEYWORD,
     u_DEFAULT_KEYWORD_MISSING,

     -- ** Break iterator errors
     u_BRK_INTERNAL_ERROR,
     u_BRK_HEX_DIGITS_EXPECTED,
     u_BRK_SEMICOLON_EXPECTED,
     u_BRK_RULE_SYNTAX,
     u_BRK_UNCLOSED_SET,
     u_BRK_ASSIGN_ERROR,
     u_BRK_VARIABLE_REDFINITION,
     u_BRK_MISMATCHED_PAREN,
     u_BRK_NEW_LINE_IN_QUOTED_STRING,
     u_BRK_UNDEFINED_VARIABLE,
     u_BRK_INIT_ERROR,
     u_BRK_RULE_EMPTY_SET,
     u_BRK_UNRECOGNIZED_OPTION,
     u_BRK_MALFORMED_RULE_TAG,

     -- ** Regular expression errors
     u_REGEX_INTERNAL_ERROR,
     u_REGEX_RULE_SYNTAX,
     u_REGEX_INVALID_STATE,
     u_REGEX_BAD_ESCAPE_SEQUENCE,
     u_REGEX_PROPERTY_SYNTAX,
     u_REGEX_UNIMPLEMENTED,
     u_REGEX_MISMATCHED_PAREN,
     u_REGEX_NUMBER_TOO_BIG,
     u_REGEX_BAD_INTERVAL,
     u_REGEX_MAX_LT_MIN,
     u_REGEX_INVALID_BACK_REF,
     u_REGEX_INVALID_FLAG,
     u_REGEX_SET_CONTAINS_STRING,
     u_REGEX_OCTAL_TOO_BIG,
     u_REGEX_INVALID_RANGE,
     u_REGEX_STACK_OVERFLOW,
     u_REGEX_TIME_OUT,
     u_REGEX_STOPPED_BY_CALLER,

     -- ** IDNA errors
     u_IDNA_PROHIBITED_ERROR,
     u_IDNA_UNASSIGNED_ERROR,
     u_IDNA_CHECK_BIDI_ERROR,
     u_IDNA_STD3_ASCII_RULES_ERROR,
     u_IDNA_ACE_PREFIX_ERROR,
     u_IDNA_VERIFICATION_ERROR,
     u_IDNA_LABEL_TOO_LONG_ERROR,
     u_IDNA_ZERO_LENGTH_LABEL_ERROR,
     u_IDNA_DOMAIN_NAME_TOO_LONG_ERROR
    ) where


{-# LINE 166 "Data\Text\ICU\Error.hsc" #-}

{-# LINE 167 "Data\Text\ICU\Error.hsc" #-}

{-# LINE 168 "Data\Text\ICU\Error.hsc" #-}


{-# LINE 170 "Data\Text\ICU\Error.hsc" #-}

import Data.Text.ICU.Error.Internal

u_USING_FALLBACK_WARNING  :: ICUError
u_USING_FALLBACK_WARNING  = ICUError (-128)
u_USING_DEFAULT_WARNING  :: ICUError
u_USING_DEFAULT_WARNING  = ICUError (-127)
u_SAFECLONE_ALLOCATED_WARNING  :: ICUError
u_SAFECLONE_ALLOCATED_WARNING  = ICUError (-126)
u_STATE_OLD_WARNING  :: ICUError
u_STATE_OLD_WARNING  = ICUError (-125)
u_STRING_NOT_TERMINATED_WARNING  :: ICUError
u_STRING_NOT_TERMINATED_WARNING  = ICUError (-124)
u_SORT_KEY_TOO_SHORT_WARNING  :: ICUError
u_SORT_KEY_TOO_SHORT_WARNING  = ICUError (-123)
u_AMBIGUOUS_ALIAS_WARNING  :: ICUError
u_AMBIGUOUS_ALIAS_WARNING  = ICUError (-122)
u_DIFFERENT_UCA_VERSION  :: ICUError
u_DIFFERENT_UCA_VERSION  = ICUError (-121)
u_ILLEGAL_ARGUMENT_ERROR  :: ICUError
u_ILLEGAL_ARGUMENT_ERROR  = ICUError 1
u_MISSING_RESOURCE_ERROR  :: ICUError
u_MISSING_RESOURCE_ERROR  = ICUError 2
u_INVALID_FORMAT_ERROR  :: ICUError
u_INVALID_FORMAT_ERROR  = ICUError 3
u_FILE_ACCESS_ERROR  :: ICUError
u_FILE_ACCESS_ERROR  = ICUError 4
u_INTERNAL_PROGRAM_ERROR  :: ICUError
u_INTERNAL_PROGRAM_ERROR  = ICUError 5
u_MESSAGE_PARSE_ERROR  :: ICUError
u_MESSAGE_PARSE_ERROR  = ICUError 6
u_MEMORY_ALLOCATION_ERROR  :: ICUError
u_MEMORY_ALLOCATION_ERROR  = ICUError 7
u_INDEX_OUTOFBOUNDS_ERROR  :: ICUError
u_INDEX_OUTOFBOUNDS_ERROR  = ICUError 8
u_PARSE_ERROR  :: ICUError
u_PARSE_ERROR  = ICUError 9
u_INVALID_CHAR_FOUND  :: ICUError
u_INVALID_CHAR_FOUND  = ICUError 10
u_TRUNCATED_CHAR_FOUND  :: ICUError
u_TRUNCATED_CHAR_FOUND  = ICUError 11
u_ILLEGAL_CHAR_FOUND  :: ICUError
u_ILLEGAL_CHAR_FOUND  = ICUError 12
u_INVALID_TABLE_FORMAT  :: ICUError
u_INVALID_TABLE_FORMAT  = ICUError 13
u_INVALID_TABLE_FILE  :: ICUError
u_INVALID_TABLE_FILE  = ICUError 14
u_BUFFER_OVERFLOW_ERROR  :: ICUError
u_BUFFER_OVERFLOW_ERROR  = ICUError 15
u_UNSUPPORTED_ERROR  :: ICUError
u_UNSUPPORTED_ERROR  = ICUError 16
u_RESOURCE_TYPE_MISMATCH  :: ICUError
u_RESOURCE_TYPE_MISMATCH  = ICUError 17
u_ILLEGAL_ESCAPE_SEQUENCE  :: ICUError
u_ILLEGAL_ESCAPE_SEQUENCE  = ICUError 18
u_UNSUPPORTED_ESCAPE_SEQUENCE  :: ICUError
u_UNSUPPORTED_ESCAPE_SEQUENCE  = ICUError 19
u_NO_SPACE_AVAILABLE  :: ICUError
u_NO_SPACE_AVAILABLE  = ICUError 20
u_CE_NOT_FOUND_ERROR  :: ICUError
u_CE_NOT_FOUND_ERROR  = ICUError 21
u_PRIMARY_TOO_LONG_ERROR  :: ICUError
u_PRIMARY_TOO_LONG_ERROR  = ICUError 22
u_STATE_TOO_OLD_ERROR  :: ICUError
u_STATE_TOO_OLD_ERROR  = ICUError 23
u_TOO_MANY_ALIASES_ERROR  :: ICUError
u_TOO_MANY_ALIASES_ERROR  = ICUError 24
u_ENUM_OUT_OF_SYNC_ERROR  :: ICUError
u_ENUM_OUT_OF_SYNC_ERROR  = ICUError 25
u_INVARIANT_CONVERSION_ERROR  :: ICUError
u_INVARIANT_CONVERSION_ERROR  = ICUError 26
u_INVALID_STATE_ERROR  :: ICUError
u_INVALID_STATE_ERROR  = ICUError 27
u_COLLATOR_VERSION_MISMATCH  :: ICUError
u_COLLATOR_VERSION_MISMATCH  = ICUError 28
u_USELESS_COLLATOR_ERROR  :: ICUError
u_USELESS_COLLATOR_ERROR  = ICUError 29
u_NO_WRITE_PERMISSION  :: ICUError
u_NO_WRITE_PERMISSION  = ICUError 30
u_BAD_VARIABLE_DEFINITION  :: ICUError
u_BAD_VARIABLE_DEFINITION  = ICUError 65536
u_MALFORMED_RULE  :: ICUError
u_MALFORMED_RULE  = ICUError 65537
u_MALFORMED_SET  :: ICUError
u_MALFORMED_SET  = ICUError 65538
u_MALFORMED_UNICODE_ESCAPE  :: ICUError
u_MALFORMED_UNICODE_ESCAPE  = ICUError 65540
u_MALFORMED_VARIABLE_DEFINITION  :: ICUError
u_MALFORMED_VARIABLE_DEFINITION  = ICUError 65541
u_MALFORMED_VARIABLE_REFERENCE  :: ICUError
u_MALFORMED_VARIABLE_REFERENCE  = ICUError 65542
u_MISPLACED_CURSOR_OFFSET  :: ICUError
u_MISPLACED_CURSOR_OFFSET  = ICUError 65545
u_MISPLACED_QUANTIFIER  :: ICUError
u_MISPLACED_QUANTIFIER  = ICUError 65546
u_MISSING_OPERATOR  :: ICUError
u_MISSING_OPERATOR  = ICUError 65547
u_MULTIPLE_ANTE_CONTEXTS  :: ICUError
u_MULTIPLE_ANTE_CONTEXTS  = ICUError 65549
u_MULTIPLE_CURSORS  :: ICUError
u_MULTIPLE_CURSORS  = ICUError 65550
u_MULTIPLE_POST_CONTEXTS  :: ICUError
u_MULTIPLE_POST_CONTEXTS  = ICUError 65551
u_TRAILING_BACKSLASH  :: ICUError
u_TRAILING_BACKSLASH  = ICUError 65552
u_UNDEFINED_SEGMENT_REFERENCE  :: ICUError
u_UNDEFINED_SEGMENT_REFERENCE  = ICUError 65553
u_UNDEFINED_VARIABLE  :: ICUError
u_UNDEFINED_VARIABLE  = ICUError 65554
u_UNQUOTED_SPECIAL  :: ICUError
u_UNQUOTED_SPECIAL  = ICUError 65555
u_UNTERMINATED_QUOTE  :: ICUError
u_UNTERMINATED_QUOTE  = ICUError 65556
u_RULE_MASK_ERROR  :: ICUError
u_RULE_MASK_ERROR  = ICUError 65557
u_MISPLACED_COMPOUND_FILTER  :: ICUError
u_MISPLACED_COMPOUND_FILTER  = ICUError 65558
u_MULTIPLE_COMPOUND_FILTERS  :: ICUError
u_MULTIPLE_COMPOUND_FILTERS  = ICUError 65559
u_INVALID_RBT_SYNTAX  :: ICUError
u_INVALID_RBT_SYNTAX  = ICUError 65560
u_MALFORMED_PRAGMA  :: ICUError
u_MALFORMED_PRAGMA  = ICUError 65562
u_UNCLOSED_SEGMENT  :: ICUError
u_UNCLOSED_SEGMENT  = ICUError 65563
u_VARIABLE_RANGE_EXHAUSTED  :: ICUError
u_VARIABLE_RANGE_EXHAUSTED  = ICUError 65565
u_VARIABLE_RANGE_OVERLAP  :: ICUError
u_VARIABLE_RANGE_OVERLAP  = ICUError 65566
u_ILLEGAL_CHARACTER  :: ICUError
u_ILLEGAL_CHARACTER  = ICUError 65567
u_INTERNAL_TRANSLITERATOR_ERROR  :: ICUError
u_INTERNAL_TRANSLITERATOR_ERROR  = ICUError 65568
u_INVALID_ID  :: ICUError
u_INVALID_ID  = ICUError 65569
u_INVALID_FUNCTION  :: ICUError
u_INVALID_FUNCTION  = ICUError 65570
u_UNEXPECTED_TOKEN  :: ICUError
u_UNEXPECTED_TOKEN  = ICUError 65792
u_MULTIPLE_DECIMAL_SEPARATORS  :: ICUError
u_MULTIPLE_DECIMAL_SEPARATORS  = ICUError 65793
u_MULTIPLE_EXPONENTIAL_SYMBOLS  :: ICUError
u_MULTIPLE_EXPONENTIAL_SYMBOLS  = ICUError 65794
u_MALFORMED_EXPONENTIAL_PATTERN  :: ICUError
u_MALFORMED_EXPONENTIAL_PATTERN  = ICUError 65795
u_MULTIPLE_PERCENT_SYMBOLS  :: ICUError
u_MULTIPLE_PERCENT_SYMBOLS  = ICUError 65796
u_MULTIPLE_PERMILL_SYMBOLS  :: ICUError
u_MULTIPLE_PERMILL_SYMBOLS  = ICUError 65797
u_MULTIPLE_PAD_SPECIFIERS  :: ICUError
u_MULTIPLE_PAD_SPECIFIERS  = ICUError 65798
u_PATTERN_SYNTAX_ERROR  :: ICUError
u_PATTERN_SYNTAX_ERROR  = ICUError 65799
u_ILLEGAL_PAD_POSITION  :: ICUError
u_ILLEGAL_PAD_POSITION  = ICUError 65800
u_UNMATCHED_BRACES  :: ICUError
u_UNMATCHED_BRACES  = ICUError 65801
u_ARGUMENT_TYPE_MISMATCH  :: ICUError
u_ARGUMENT_TYPE_MISMATCH  = ICUError 65804
u_DUPLICATE_KEYWORD  :: ICUError
u_DUPLICATE_KEYWORD  = ICUError 65805
u_UNDEFINED_KEYWORD  :: ICUError
u_UNDEFINED_KEYWORD  = ICUError 65806
u_DEFAULT_KEYWORD_MISSING  :: ICUError
u_DEFAULT_KEYWORD_MISSING  = ICUError 65807
u_BRK_INTERNAL_ERROR  :: ICUError
u_BRK_INTERNAL_ERROR  = ICUError 66048
u_BRK_HEX_DIGITS_EXPECTED  :: ICUError
u_BRK_HEX_DIGITS_EXPECTED  = ICUError 66049
u_BRK_SEMICOLON_EXPECTED  :: ICUError
u_BRK_SEMICOLON_EXPECTED  = ICUError 66050
u_BRK_RULE_SYNTAX  :: ICUError
u_BRK_RULE_SYNTAX  = ICUError 66051
u_BRK_UNCLOSED_SET  :: ICUError
u_BRK_UNCLOSED_SET  = ICUError 66052
u_BRK_ASSIGN_ERROR  :: ICUError
u_BRK_ASSIGN_ERROR  = ICUError 66053
u_BRK_VARIABLE_REDFINITION  :: ICUError
u_BRK_VARIABLE_REDFINITION  = ICUError 66054
u_BRK_MISMATCHED_PAREN  :: ICUError
u_BRK_MISMATCHED_PAREN  = ICUError 66055
u_BRK_NEW_LINE_IN_QUOTED_STRING  :: ICUError
u_BRK_NEW_LINE_IN_QUOTED_STRING  = ICUError 66056
u_BRK_UNDEFINED_VARIABLE  :: ICUError
u_BRK_UNDEFINED_VARIABLE  = ICUError 66057
u_BRK_INIT_ERROR  :: ICUError
u_BRK_INIT_ERROR  = ICUError 66058
u_BRK_RULE_EMPTY_SET  :: ICUError
u_BRK_RULE_EMPTY_SET  = ICUError 66059
u_BRK_UNRECOGNIZED_OPTION  :: ICUError
u_BRK_UNRECOGNIZED_OPTION  = ICUError 66060
u_BRK_MALFORMED_RULE_TAG  :: ICUError
u_BRK_MALFORMED_RULE_TAG  = ICUError 66061
u_REGEX_INTERNAL_ERROR  :: ICUError
u_REGEX_INTERNAL_ERROR  = ICUError 66304
u_REGEX_RULE_SYNTAX  :: ICUError
u_REGEX_RULE_SYNTAX  = ICUError 66305
u_REGEX_INVALID_STATE  :: ICUError
u_REGEX_INVALID_STATE  = ICUError 66306
u_REGEX_BAD_ESCAPE_SEQUENCE  :: ICUError
u_REGEX_BAD_ESCAPE_SEQUENCE  = ICUError 66307
u_REGEX_PROPERTY_SYNTAX  :: ICUError
u_REGEX_PROPERTY_SYNTAX  = ICUError 66308
u_REGEX_UNIMPLEMENTED  :: ICUError
u_REGEX_UNIMPLEMENTED  = ICUError 66309
u_REGEX_MISMATCHED_PAREN  :: ICUError
u_REGEX_MISMATCHED_PAREN  = ICUError 66310
u_REGEX_NUMBER_TOO_BIG  :: ICUError
u_REGEX_NUMBER_TOO_BIG  = ICUError 66311
u_REGEX_BAD_INTERVAL  :: ICUError
u_REGEX_BAD_INTERVAL  = ICUError 66312
u_REGEX_MAX_LT_MIN  :: ICUError
u_REGEX_MAX_LT_MIN  = ICUError 66313
u_REGEX_INVALID_BACK_REF  :: ICUError
u_REGEX_INVALID_BACK_REF  = ICUError 66314
u_REGEX_INVALID_FLAG  :: ICUError
u_REGEX_INVALID_FLAG  = ICUError 66315
u_REGEX_SET_CONTAINS_STRING  :: ICUError
u_REGEX_SET_CONTAINS_STRING  = ICUError 66317
u_REGEX_OCTAL_TOO_BIG  :: ICUError
u_REGEX_OCTAL_TOO_BIG  = ICUError 66318
u_REGEX_INVALID_RANGE  :: ICUError
u_REGEX_INVALID_RANGE  = ICUError 66320
u_REGEX_STACK_OVERFLOW  :: ICUError
u_REGEX_STACK_OVERFLOW  = ICUError 66321
u_REGEX_TIME_OUT  :: ICUError
u_REGEX_TIME_OUT  = ICUError 66322
u_REGEX_STOPPED_BY_CALLER  :: ICUError
u_REGEX_STOPPED_BY_CALLER  = ICUError 66323
u_IDNA_PROHIBITED_ERROR  :: ICUError
u_IDNA_PROHIBITED_ERROR  = ICUError 66560
u_IDNA_UNASSIGNED_ERROR  :: ICUError
u_IDNA_UNASSIGNED_ERROR  = ICUError 66561
u_IDNA_CHECK_BIDI_ERROR  :: ICUError
u_IDNA_CHECK_BIDI_ERROR  = ICUError 66562
u_IDNA_STD3_ASCII_RULES_ERROR  :: ICUError
u_IDNA_STD3_ASCII_RULES_ERROR  = ICUError 66563
u_IDNA_ACE_PREFIX_ERROR  :: ICUError
u_IDNA_ACE_PREFIX_ERROR  = ICUError 66564
u_IDNA_VERIFICATION_ERROR  :: ICUError
u_IDNA_VERIFICATION_ERROR  = ICUError 66565
u_IDNA_LABEL_TOO_LONG_ERROR  :: ICUError
u_IDNA_LABEL_TOO_LONG_ERROR  = ICUError 66566
u_IDNA_ZERO_LENGTH_LABEL_ERROR  :: ICUError
u_IDNA_ZERO_LENGTH_LABEL_ERROR  = ICUError 66567
u_IDNA_DOMAIN_NAME_TOO_LONG_ERROR  :: ICUError
u_IDNA_DOMAIN_NAME_TOO_LONG_ERROR  = ICUError 66568

{-# LINE 297 "Data\Text\ICU\Error.hsc" #-}

isRegexError :: ICUError -> Bool
isRegexError (ICUError err) =
    err >= 66304 && err < 66324
{-# LINE 301 "Data\Text\ICU\Error.hsc" #-}
