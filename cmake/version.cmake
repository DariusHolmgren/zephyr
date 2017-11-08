include($ENV{ZEPHYR_BASE}/cmake/hex.cmake)
file(READ $ENV{ZEPHYR_BASE}/VERSION ver)

string(REGEX MATCH "VERSION_MAJOR = ([0-9]*)" _ ${ver})
set(PROJECT_VERSION_MAJOR ${CMAKE_MATCH_1})

string(REGEX MATCH "VERSION_MINOR = ([0-9]*)" _ ${ver})
set(PROJECT_VERSION_MINOR ${CMAKE_MATCH_1})

string(REGEX MATCH "PATCHLEVEL = ([0-9]*)" _ ${ver})
set(PROJECT_VERSION_PATCH ${CMAKE_MATCH_1})

string(REGEX MATCH "VERSION_TWEAK = ([0-9]*)" _ ${ver})
set(PROJECT_VERSION_TWEAK ${CMAKE_MATCH_1})

string(REGEX MATCH "EXTRAVERSION = (.*)" _ ${ver})
set(PROJECT_VERSION_EXTRA ${CMAKE_MATCH_1})


message("Zephyr version: ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}.${PROJECT_VERSION_PATCH}")

set(PROJECT_VERSION ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}.${PROJECT_VERSION_PATCH})
if(PROJECT_VERSION_TWEAK)
  set(PROJECT_VERSION "${PROJECT_VERSION}.${PROJECT_VERSION_TWEAK}")
endif()

set(MAJOR ${PROJECT_VERSION_MAJOR}) # Temporary convenience variable
set(MINOR ${PROJECT_VERSION_MINOR}) # Temporary convenience variable
set(PATCH ${PROJECT_VERSION_PATCH}) # Temporary convenience variable

math(EXPR ZEPHYR_VERSION_CODE                      "(${MAJOR} << 16) + (${MINOR} << 8) + (${PATCH})")
math(EXPR KERNEL_VERSION_NUMBER_INT                "(${MAJOR} << 16) + (${MINOR} << 8) + (${PATCH})")
math(EXPR KERNELVERSION_INT "(${MAJOR} << 24) + (${MINOR} << 16) + (${PATCH} << 8) + ${PROJECT_VERSION_TWEAK}")

to_hex(${KERNELVERSION_INT} KERNELVERSION)
to_hex(${KERNEL_VERSION_NUMBER_INT} KERNEL_VERSION_NUMBER)

unset(MAJOR)
unset(MINOR)
unset(PATCH)

set(KERNEL_VERSION_MAJOR      ${PROJECT_VERSION_MAJOR})
set(KERNEL_VERSION_MINOR      ${PROJECT_VERSION_MINOR})
set(KERNEL_PATCHLEVEL         ${PROJECT_VERSION_PATCH})
set(KERNEL_VERSION_STRING     "\"${PROJECT_VERSION}\"")

