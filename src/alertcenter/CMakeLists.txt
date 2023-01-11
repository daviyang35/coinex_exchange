cmake_minimum_required(VERSION 3.2)

project(alertcenter)

aux_source_directory(. SOURCE_FILES)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../network)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../utils)

add_executable(alertcenter ${SOURCE_FILES})
target_link_libraries(alertcenter ${JANSSON_LIBRARIES}  utils ${LIBRDKAFKA_LIBRARIES} ${HIREDIS_LIBRARY} ${CURL_LIBRARIES})
