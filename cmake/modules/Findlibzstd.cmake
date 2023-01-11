#
# - Try to find Facebook libzstd library
# This will define
# LIBZSTD_FOUND
# LIBZSTD_INCLUDE_DIR
# LIBZSTD_LIBRARIES
#

find_path(
        LIBZSTD_INCLUDE_DIRS zstd.h
        HINTS
        $ENV{LIBZSTD_ROOT}/include
        ${LIBZSTD_ROOT}/include
)

find_library(
        LIBZSTD_LIBRARIES zstd zstd_static
        HINTS
        $ENV{LIBZSTD_ROOT}/lib
        ${LIBZSTD_ROOT}/lib
)

mark_as_advanced(LIBZSTD_INCLUDE_DIRS LIBZSTD_LIBRARIES)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(libzstd LIBZSTD_INCLUDE_DIRS LIBZSTD_LIBRARIES)

if (LIBZSTD_FOUND)
    message(STATUS "Found libzstd")
    message(STATUS "LIBZSTD_INCLUDE_DIRS: ${LIBZSTD_INCLUDE_DIRS}")
    message(STATUS "LIBZSTD_LIBRARIES: ${LIBZSTD_LIBRARIES}")
else ()
    message(FATAL_ERROR "Cannot found libzstd, please install manually.")
endif ()
