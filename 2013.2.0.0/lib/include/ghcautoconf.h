#ifndef __GHCAUTOCONF_H__
#define __GHCAUTOCONF_H__
/* mk/config.h.  Generated from config.h.in by configure.  */
/* mk/config.h.in.  Generated from configure.ac by autoheader.  */

/* Define if building universal (internal helper macro) */
/* #undef AC_APPLE_UNIVERSAL_BUILD */

/* The alignment of a `char'. */
#define ALIGNMENT_CHAR 1

/* The alignment of a `double'. */
#define ALIGNMENT_DOUBLE 8

/* The alignment of a `float'. */
#define ALIGNMENT_FLOAT 4

/* The alignment of a `int'. */
#define ALIGNMENT_INT 4

/* The alignment of a `long'. */
#define ALIGNMENT_LONG 4

/* The alignment of a `long long'. */
#define ALIGNMENT_LONG_LONG 8

/* The alignment of a `short'. */
#define ALIGNMENT_SHORT 2

/* The alignment of a `unsigned char'. */
#define ALIGNMENT_UNSIGNED_CHAR 1

/* The alignment of a `unsigned int'. */
#define ALIGNMENT_UNSIGNED_INT 4

/* The alignment of a `unsigned long'. */
#define ALIGNMENT_UNSIGNED_LONG 4

/* The alignment of a `unsigned long long'. */
#define ALIGNMENT_UNSIGNED_LONG_LONG 8

/* The alignment of a `unsigned short'. */
#define ALIGNMENT_UNSIGNED_SHORT 2

/* The alignment of a `void *'. */
#define ALIGNMENT_VOID_P 4

/* Define to one of `_getb67', `GETB67', `getb67' for Cray-2 and Cray-YMP
   systems. This function is required for `alloca.c' support on those systems.
   */
/* #undef CRAY_STACKSEG_END */

/* Define to 1 if using `alloca.c'. */
/* #undef C_ALLOCA */

/* Define to 1 if your processor stores words of floats with the most
   significant byte first */
/* #undef FLOAT_WORDS_BIGENDIAN */

/* Has visibility hidden */
/* #undef HAS_VISIBILITY_HIDDEN */

/* Define to 1 if you have `alloca', as a function or macro. */
#define HAVE_ALLOCA 1

/* Define to 1 if you have <alloca.h> and it should be used (not on Ultrix).
   */
/* #undef HAVE_ALLOCA_H */

/* Define to 1 if you have the <bfd.h> header file. */
#define HAVE_BFD_H 1

/* Define to 1 if you have /bin/sh. */
#define HAVE_BIN_SH 1

/* Define to 1 if you have the `clock_gettime' function. */
/* #undef HAVE_CLOCK_GETTIME */

/* Define to 1 if you have the `ctime_r' function. */
/* #undef HAVE_CTIME_R */

/* Define to 1 if you have the <ctype.h> header file. */
#define HAVE_CTYPE_H 1

/* Define to 1 if you have the declaration of `ctime_r', and to 0 if you
   don't. */
#define HAVE_DECL_CTIME_R 0

/* Define to 1 if you have the <dirent.h> header file. */
#define HAVE_DIRENT_H 1

/* Define to 1 if you have the <dlfcn.h> header file. */
/* #undef HAVE_DLFCN_H */

/* Define to 1 if you have the <errno.h> header file. */
#define HAVE_ERRNO_H 1

/* Define to 1 if you have the `eventfd' function. */
/* #undef HAVE_EVENTFD */

/* Define to 1 if you have the <fcntl.h> header file. */
#define HAVE_FCNTL_H 1

/* Define to 1 if you have the `fork' function. */
/* #undef HAVE_FORK */

/* Define to 1 if you have the `getclock' function. */
/* #undef HAVE_GETCLOCK */

/* Define to 1 if you have the `GetModuleFileName' function. */
#define HAVE_GETMODULEFILENAME 1

/* Define to 1 if you have the `getrusage' function. */
/* #undef HAVE_GETRUSAGE */

/* Define to 1 if you have the `gettimeofday' function. */
#define HAVE_GETTIMEOFDAY 1

/* Define to 1 if you have the <grp.h> header file. */
/* #undef HAVE_GRP_H */

/* Define to 1 if you have the <inttypes.h> header file. */
#define HAVE_INTTYPES_H 1

/* Define to 1 if you have the `bfd' library (-lbfd). */
#define HAVE_LIBBFD 1

/* Define to 1 if you need -ldl to get dlopen(). */
/* #undef HAVE_LIBDL */

/* Define to 1 if you have the `iberty' library (-liberty). */
#define HAVE_LIBIBERTY 1

/* Define to 1 if you need to link with libm */
#define HAVE_LIBM 1

/* Define to 1 if you have the `rt' library (-lrt). */
/* #undef HAVE_LIBRT */

/* Define to 1 if you have the <limits.h> header file. */
#define HAVE_LIMITS_H 1

/* Define to 1 if you have the <locale.h> header file. */
#define HAVE_LOCALE_H 1

/* Define to 1 if the system has the type `long long'. */
#define HAVE_LONG_LONG 1

/* Define to 1 if you have the <memory.h> header file. */
#define HAVE_MEMORY_H 1

/* Define to 1 if you have the mingwex library. */
#define HAVE_MINGWEX 1

/* Define to 1 if you have the <nlist.h> header file. */
/* #undef HAVE_NLIST_H */

/* Define to 1 if we have printf$LDBLStub (Apple Mac OS >= 10.4, PPC). */
#define HAVE_PRINTF_LDBLSTUB 0

/* Define to 1 if you have the <pthread.h> header file. */
#define HAVE_PTHREAD_H 1

/* Define to 1 if you have the <pwd.h> header file. */
/* #undef HAVE_PWD_H */

/* Define to 1 if you have the <sched.h> header file. */
#define HAVE_SCHED_H 1

/* Define to 1 if you have the `sched_setaffinity' function. */
/* #undef HAVE_SCHED_SETAFFINITY */

/* Define to 1 if you have the `setitimer' function. */
/* #undef HAVE_SETITIMER */

/* Define to 1 if setitimer accepts ITIMER_VIRTUAL, 0 else. */
/* #undef HAVE_SETITIMER_VIRTUAL */

/* Define to 1 if you have the `setlocale' function. */
#define HAVE_SETLOCALE 1

/* Define to 1 if you have the `siginterrupt' function. */
/* #undef HAVE_SIGINTERRUPT */

/* Define to 1 if you have the <signal.h> header file. */
#define HAVE_SIGNAL_H 1

/* Define to 1 if you have the <stdint.h> header file. */
#define HAVE_STDINT_H 1

/* Define to 1 if you have the <stdlib.h> header file. */
#define HAVE_STDLIB_H 1

/* Define to 1 if you have the <strings.h> header file. */
#define HAVE_STRINGS_H 1

/* Define to 1 if you have the <string.h> header file. */
#define HAVE_STRING_H 1

/* Define to 1 if Apple-style dead-stripping is supported. */
/* #undef HAVE_SUBSECTIONS_VIA_SYMBOLS */

/* Define to 1 if you have the `sysconf' function. */
/* #undef HAVE_SYSCONF */

/* Define to 1 if you have the <sys/cpuset.h> header file. */
/* #undef HAVE_SYS_CPUSET_H */

/* Define to 1 if you have the <sys/eventfd.h> header file. */
/* #undef HAVE_SYS_EVENTFD_H */

/* Define to 1 if you have the <sys/mman.h> header file. */
/* #undef HAVE_SYS_MMAN_H */

/* Define to 1 if you have the <sys/resource.h> header file. */
/* #undef HAVE_SYS_RESOURCE_H */

/* Define to 1 if you have the <sys/select.h> header file. */
/* #undef HAVE_SYS_SELECT_H */

/* Define to 1 if you have the <sys/stat.h> header file. */
#define HAVE_SYS_STAT_H 1

/* Define to 1 if you have the <sys/timeb.h> header file. */
#define HAVE_SYS_TIMEB_H 1

/* Define to 1 if you have the <sys/timers.h> header file. */
/* #undef HAVE_SYS_TIMERS_H */

/* Define to 1 if you have the <sys/times.h> header file. */
/* #undef HAVE_SYS_TIMES_H */

/* Define to 1 if you have the <sys/time.h> header file. */
#define HAVE_SYS_TIME_H 1

/* Define to 1 if you have the <sys/types.h> header file. */
#define HAVE_SYS_TYPES_H 1

/* Define to 1 if you have the <sys/utsname.h> header file. */
/* #undef HAVE_SYS_UTSNAME_H */

/* Define to 1 if you have the <sys/wait.h> header file. */
/* #undef HAVE_SYS_WAIT_H */

/* Define to 1 if you have the <termios.h> header file. */
/* #undef HAVE_TERMIOS_H */

/* Define to 1 if you have the `timer_create' function. */
/* #undef HAVE_TIMER_CREATE */

/* Define to 1 if you have the `timer_settime' function. */
/* #undef HAVE_TIMER_SETTIME */

/* Define to 1 if you have the `times' function. */
/* #undef HAVE_TIMES */

/* Define to 1 if you have the <time.h> header file. */
#define HAVE_TIME_H 1

/* Define to 1 if you have the <unistd.h> header file. */
#define HAVE_UNISTD_H 1

/* Define to 1 if you have the <utime.h> header file. */
#define HAVE_UTIME_H 1

/* Define to 1 if you have the `vfork' function. */
/* #undef HAVE_VFORK */

/* Define to 1 if you have the <vfork.h> header file. */
/* #undef HAVE_VFORK_H */

/* Define to 1 if you have the <windows.h> header file. */
#define HAVE_WINDOWS_H 1

/* Define to 1 if you have the `WinExec' function. */
#define HAVE_WINEXEC 1

/* Define to 1 if you have the <winsock.h> header file. */
#define HAVE_WINSOCK_H 1

/* Define to 1 if `fork' works. */
/* #undef HAVE_WORKING_FORK */

/* Define to 1 if `vfork' works. */
/* #undef HAVE_WORKING_VFORK */

/* Define to 1 if you have the `__mingw_vfprintf' function. */
#define HAVE___MINGW_VFPRINTF 1

/* Define to 1 if C symbols have a leading underscore added by the compiler.
   */
#define LEADING_UNDERSCORE 1

/* Define to the address where bug reports for this package should be sent. */
/* #undef PACKAGE_BUGREPORT */

/* Define to the full name of this package. */
/* #undef PACKAGE_NAME */

/* Define to the full name and version of this package. */
/* #undef PACKAGE_STRING */

/* Define to the one symbol short name of this package. */
/* #undef PACKAGE_TARNAME */

/* Define to the home page for this package. */
/* #undef PACKAGE_URL */

/* Define to the version of this package. */
/* #undef PACKAGE_VERSION */

/* Define as the return type of signal handlers (`int' or `void'). */
#define RETSIGTYPE void

/* The size of `char', as computed by sizeof. */
#define SIZEOF_CHAR 1

/* The size of `double', as computed by sizeof. */
#define SIZEOF_DOUBLE 8

/* The size of `float', as computed by sizeof. */
#define SIZEOF_FLOAT 4

/* The size of `int', as computed by sizeof. */
#define SIZEOF_INT 4

/* The size of `long', as computed by sizeof. */
#define SIZEOF_LONG 4

/* The size of `long long', as computed by sizeof. */
#define SIZEOF_LONG_LONG 8

/* The size of `short', as computed by sizeof. */
#define SIZEOF_SHORT 2

/* The size of `unsigned char', as computed by sizeof. */
#define SIZEOF_UNSIGNED_CHAR 1

/* The size of `unsigned int', as computed by sizeof. */
#define SIZEOF_UNSIGNED_INT 4

/* The size of `unsigned long', as computed by sizeof. */
#define SIZEOF_UNSIGNED_LONG 4

/* The size of `unsigned long long', as computed by sizeof. */
#define SIZEOF_UNSIGNED_LONG_LONG 8

/* The size of `unsigned short', as computed by sizeof. */
#define SIZEOF_UNSIGNED_SHORT 2

/* The size of `void *', as computed by sizeof. */
#define SIZEOF_VOID_P 4

/* If using the C implementation of alloca, define if you know the
   direction of stack growth for your system; otherwise it will be
   automatically deduced at runtime.
	STACK_DIRECTION > 0 => grows toward higher addresses
	STACK_DIRECTION < 0 => grows toward lower addresses
	STACK_DIRECTION = 0 => direction of growth unknown */
/* #undef STACK_DIRECTION */

/* Define to 1 if you have the ANSI C header files. */
#define STDC_HEADERS 1

/* Define to 1 if you can safely include both <sys/time.h> and <time.h>. */
#define TIME_WITH_SYS_TIME 1

/* Define to 1 if we can use timer_create(CLOCK_PROCESS_CPUTIME_ID,...) */
/* #undef USE_TIMER_CREATE */

/* Define to 1 if signal handlers have type void (*)(int). Otherwise, they're
   assumed to have type int (*)(void). */
#define VOID_INT_SIGNALS 1

/* Define WORDS_BIGENDIAN to 1 if your processor stores words with the most
   significant byte first (like Motorola and SPARC, unlike Intel). */
#if defined AC_APPLE_UNIVERSAL_BUILD
# if defined __BIG_ENDIAN__
#  define WORDS_BIGENDIAN 1
# endif
#else
# ifndef WORDS_BIGENDIAN
/* #  undef WORDS_BIGENDIAN */
# endif
#endif

/* Number of bits in a file offset, on hosts where this is settable. */
/* #undef _FILE_OFFSET_BITS */

/* Define for large files, on AIX-style hosts. */
/* #undef _LARGE_FILES */

/* ARM pre v6 */
/* #undef arm_HOST_ARCH_PRE_ARMv6 */

/* ARM pre v7 */
/* #undef arm_HOST_ARCH_PRE_ARMv7 */

/* Define to empty if `const' does not conform to ANSI C. */
/* #undef const */

/* Define to `int' if <sys/types.h> does not define. */
/* #undef pid_t */

/* Define as `fork' if `vfork' does not work. */
#define vfork fork

#define TABLES_NEXT_TO_CODE 1
#endif /* __GHCAUTOCONF_H__ */
