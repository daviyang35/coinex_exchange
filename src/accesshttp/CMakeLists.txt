cmake_minimum_required(VERSION 3.2)

aux_source_directory(. SOURCE_FILES)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../network)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../utils)

add_executable(accesshttp ${SOURCE_FILES})

target_link_libraries(accesshttp ${JANSSON_LIBRARIES} utils
        ${MPDECIMAL_LIBRARIES} ${ZLIB_LIBRARIES} ${OPENSSL_LIBRARIES} ${LIBEV_LIBRARIES} ${LIBRDKAFKA_LIBRARIES}
        )

add_custom_command(TARGET accesshttp POST_BUILD        # Adds a post-build event to MyTest
        COMMAND ${CMAKE_COMMAND} -E copy_if_different  # which executes "cmake - E copy_if_different..."
        ${CMAKE_CURRENT_SOURCE_DIR}/config.json ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/accesshttp.json
        )

