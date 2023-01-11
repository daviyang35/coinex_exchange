# -*- cmake -*-

# Macro Defined

# Using as
# Search_Headers(INC_DIRS)
# include_directories(${INC_DIRS})
MACRO(Search_Headers return_list)
    FILE(GLOB_RECURSE new_list *.h)
    SET(dir_list "")
    FOREACH(file_path ${new_list})
        GET_FILENAME_COMPONENT(dir_path ${file_path} PATH)
        SET(dir_list ${dir_list} ${dir_path})
    ENDFOREACH()
    LIST(REMOVE_DUPLICATES dir_list)
    SET(${return_list} ${dir_list})
ENDMACRO()


# Taken from http://www.cmake.org/Wiki/CMakeCopyIfDifferent
# Generates a rule to copy each source file from source directory to destination directory.
#
# Typical use -
#
# SET(SRC_FILES head1.h head2.h head3.h)
# COPY_IF_DIFFERENT( /from_dir /to_dir IncludeTargets ${SRC_FILES})
# ADD_TARGET(CopyIncludes ALL DEPENDS ${IncludeTargets})

MACRO(COPY_IF_DIFFERENT FROM_DIR TO_DIR TARGETS)
    # Macro to implement copy_if_different for a list of files
    # Arguments -
    #   FROM_DIR - this is the source directory
    #   TO_DIR   - this is the destination directory
    #   TARGETS  - A variable to receive a list of targets
    #   FILES    - names of the files to copy
    #              TODO: add globing.
    SET(AddTargets "")
    FOREACH(SRC ${ARGN})
        GET_FILENAME_COMPONENT(SRCFILE ${SRC} NAME)
        IF("${FROM_DIR}" STREQUAL "")
            SET(FROM ${SRC})
        ELSE("${FROM_DIR}" STREQUAL "")
            SET(FROM ${FROM_DIR}/${SRC})
        ENDIF("${FROM_DIR}" STREQUAL "")
        IF("${TO_DIR}" STREQUAL "")
            SET(TO ${SRCFILE})
        ELSE("${TO_DIR}" STREQUAL "")
            SET(TO   ${TO_DIR}/${SRCFILE})
        ENDIF("${TO_DIR}" STREQUAL "")
        ADD_CUSTOM_COMMAND(
                OUTPUT  "${TO}"
                COMMAND ${CMAKE_COMMAND} -E copy_if_different ${FROM} ${TO}
                DEPENDS ${FROM}
                COMMENT "Copying ${SRCFILE} ${TO_DIR}"
        )
        SET(AddTargets ${AddTargets} ${TO})
    ENDFOREACH(SRC ${ARGN})
    SET(${TARGETS} ${AddTargets})
ENDMACRO(COPY_IF_DIFFERENT FROM_DIR TO_DIR TARGETS)

# Execution Macro
#Search_Headers(INC_DIRS)
#include_directories(${INC_DIRS})
