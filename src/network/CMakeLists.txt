cmake_minimum_required(VERSION 3.2)

aux_source_directory(. SOURCE_FILES)

add_library(network STATIC ${SOURCE_FILES})
target_link_libraries(network ${JANSSON_LIBRARIES} ${LIBEV_LIBRARIES})
