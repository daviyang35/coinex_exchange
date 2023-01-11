cmake_minimum_required(VERSION 3.2)

project(cachecenter)

aux_source_directory(. SOURCE_FILES)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../network)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../utils)

add_executable(cachecenter ${SOURCE_FILES})
target_link_libraries(cachecenter utils ${LIBRDKAFKA_LIBRARIES})
