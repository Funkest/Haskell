#ifndef __GHCPLATFORM_H__
#define __GHCPLATFORM_H__

#define BuildPlatform_TYPE  i386_unknown_mingw32
#define HostPlatform_TYPE   i386_unknown_mingw32

#define i386_unknown_mingw32_BUILD  1
#define i386_unknown_mingw32_HOST  1

#define i386_BUILD_ARCH  1
#define i386_HOST_ARCH  1
#define BUILD_ARCH  "i386"
#define HOST_ARCH  "i386"

#define mingw32_BUILD_OS  1
#define mingw32_HOST_OS  1
#define BUILD_OS  "mingw32"
#define HOST_OS  "mingw32"

#define unknown_BUILD_VENDOR  1
#define unknown_HOST_VENDOR  1
#define BUILD_VENDOR  "unknown"
#define HOST_VENDOR  "unknown"

/* These TARGET macros are for backwards compatibily... DO NOT USE! */
#define TargetPlatform_TYPE i386_unknown_mingw32
#define i386_unknown_mingw32_TARGET  1
#define i386_TARGET_ARCH  1
#define TARGET_ARCH  "i386"
#define mingw32_TARGET_OS  1
#define TARGET_OS  "mingw32"
#define unknown_TARGET_VENDOR  1

#endif /* __GHCPLATFORM_H__ */
