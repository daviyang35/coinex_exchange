# - Try to find MPDecimal
# Once done this will define
#  MPDECIMAL_FOUND - System has LibMPDec
#  MPDECIMAL_INCLUDE_DIRS - The LibMPDec include directories
#  MPDECIMAL_LIBRARIES - The libraries needed to use LibMPDec
#  MPDECIMAL_DEFINITIONS - Compiler switches required for using LibMPDec

if (MPDECIMAL_LIBRARY AND MPDECIMAL_LIBRARY)
    # in cache already
    set(MPDECIMAL_FIND_QUIETLY TRUE)
endif ()

find_path(MPDECIMAL_INCLUDE_DIR
        NAMES
        mpdecimal.h
        HINTS
        ${MPDECIMAL_INCLUDEDIR}
        ${MPDECIMAL_INCLUDE_DIRS}
        ${MPDECIMAL_INSTALL_DIR}/include
        )

find_library(MPDECIMAL_LIBRARY
        NAMES
        mpdec
        HINTS
        ${IBMPDEC_LIBDIR}
        ${MPDECIMAL_LIBRARY_DIRS}
        ${MPDECIMAL_INSTALL_DIR}/lib64/
        ${MPDECIMAL_INSTALL_DIR}/lib/
        )

include(FindPackageHandleStandardArgs)
# handle the QUIETLY and REQUIRED arguments and set MPDECIMAL_FOUND to TRUE
# if all listed variables are TRUE
find_package_handle_standard_args(MPDecimal REQUIRED_VARS MPDECIMAL_LIBRARY MPDECIMAL_INCLUDE_DIR VERSION_VAR MPDECIMAL_VERSION_STRING)

mark_as_advanced(MPDECIMAL_INCLUDE_DIR MPDECIMAL_LIBRARY)

IF (MPDECIMAL_FOUND)
    set(MPDECIMAL_INCLUDE_DIRS ${MPDECIMAL_INCLUDE_DIR})
    set(MPDECIMAL_LIBRARIES ${MPDECIMAL_LIBRARY})
ENDIF ()

if (MPDECIMAL_FOUND)
    message(STATUS "Found MPDecimal")
    message(STATUS "MPDECIMAL_INCLUDE_DIRS: ${MPDECIMAL_INCLUDE_DIRS}")
    message(STATUS "MPDECIMAL_LIBRARIES: ${MPDECIMAL_LIBRARIES}")
else ()
    message(FATAL_ERROR "Cannot found MPDecimal, please install manually.")
endif ()
