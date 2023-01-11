cmake_minimum_required(VERSION 3.2)

project(historyreader)

aux_source_directory(. SOURCE_FILES)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../network)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../utils)

add_executable(historyreader ${SOURCE_FILES})
target_link_libraries(historyreader utils ${MYSQL_LIBRARIES})
