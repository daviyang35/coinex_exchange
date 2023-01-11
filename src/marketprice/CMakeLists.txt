cmake_minimum_required(VERSION 3.2)

project(marketprice)

aux_source_directory(. SOURCE_FILES)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../network)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../utils)

add_executable(marketprice ${SOURCE_FILES})
target_link_libraries(marketprice utils ${MYSQL_LIBRARIES} ${LIBRDKAFKA_LIBRARIES} ${HIREDIS_LIBRARIES} ${CURL_LIBRARIES})
