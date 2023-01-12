cmake_minimum_required(VERSION 3.2)

project(coinex_exchange)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${CMAKE_SOURCE_DIR}/cmake" "${CMAKE_SOURCE_DIR}/cmake/modules/")

include(CommMacro)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

find_package(PkgConfig QUIET)

# librdkafka depends on pthread and zlib
find_package(Threads REQUIRED)
find_package(ZLIB REQUIRED)

# CURL
find_package(CURL REQUIRED)
include_directories(${CURL_INCLUDE_DIRS})

if (CURL_FOUND)
    message(STATUS "Found CURL")
    message(STATUS "CURL_INCLUDE_DIR: ${CURL_INCLUDE_DIR}")
    message(STATUS "CURL_LIBRARIES: ${CURL_LIBRARIES}")
else ()
    message(FATAL_ERROR "Cannot found CURL, please install manually.")
endif ()

set(OPENSSL_ROOT_DIR "/usr/local/opt/openssl@1.1")

set(I "/opt/local/include")
set(L "/opt/local/lib")
find_package(OpenSSL REQUIRED)
include_directories(${OPENSSL_INCLUDE_DIR})

if (OPENSSL_FOUND)
    message(STATUS "Found OpenSSL")
    message(STATUS "OPENSSL_INCLUDE_DIR: ${OPENSSL_INCLUDE_DIR}")
    message(STATUS "OPENSSL_LIBRARIES: ${OPENSSL_LIBRARIES}")
else ()
    message(FATAL_ERROR "Cannot found OpenSSL, please install manually.")
endif ()

# libev
find_package(libev REQUIRED)
include_directories(${LIBEV_INCLUDE_DIRS})

# jansson
find_package(jansson REQUIRED)
include_directories(${JANSSON_INCLUDE_DIRS})

find_package(MySQL REQUIRED)
include_directories(${MYSQL_INCLUDE_DIR})

# hiredis
find_package(hiredis REQUIRED)
include_directories(${HIREDIS_INCLUDE_DIRS})

# MPDecimal
FIND_PACKAGE(MPDecimal REQUIRED)
INCLUDE_DIRECTORIES(${MPDECIMAL_INCLUDE_DIR})

# librdkafka
FIND_PACKAGE(librdkafka REQUIRED)
INCLUDE_DIRECTORIES(${LIBRDKAFKA_INCLUDE_DIR})

# libzstd
FIND_PACKAGE(libzstd REQUIRED)
INCLUDE_DIRECTORIES(${LIBZSTD_INCLUDE_DIR})

enable_testing()
include(GTest)
#FIND_PACKAGE(GTest REQUIRED)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/dist/")

add_subdirectory(src)
