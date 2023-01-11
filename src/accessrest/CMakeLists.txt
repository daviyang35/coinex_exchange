cmake_minimum_required(VERSION 3.2)

project(accessrest)

aux_source_directory(. SOURCE_FILES)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../network)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../utils)

add_executable(accessrest ${SOURCE_FILES})
target_link_libraries(accessrest utils ${CURL_LIBRARIES} )
