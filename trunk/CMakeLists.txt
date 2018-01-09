cmake_minimum_required(VERSION 2.6)

Project(face-detect)

# compile params
set(CMAKE_CXX_FLAGS "-g -std=c++11 -Wall")

set(SRC_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src)
set(SRC_FILE_LISTS)

# common part
include_directories(${SRC_DIR}/common)
aux_source_directory(${SRC_DIR}/common SRC_FILE_LISTS)

# main part
include_directories(${SRC_DIR}/main)
aux_source_directory(${SRC_DIR}/main SRC_FILE_LISTS)

# binary
add_executable(face-detect ${SRC_DIR}/main/fd-main.cpp ${SRC_FILE_LISTS})
