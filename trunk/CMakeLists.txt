cmake_minimum_required(VERSION 2.6)

Project(face-detect-demo)

# objs
set (THIRD_PARTY_DIR ${CMAKE_CURRENT_SOURCE_DIR}/third-party)
set (BINARY_DIR ${CMAKE_CURRENT_SOURCE_DIR}/objs/)
set (LIB_DIR ${CMAKE_CURRENT_SOURCE_DIR}/objs/lib)
set (EXECUTABLE_OUTPUT_PATH ${BINARY_DIR})
set (LIBRARY_OUTPUT_PATH ${LIB_DIR})
set(SRC_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src)

# add third party
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/pre-lib.cmake)

# compile params
set(CMAKE_CXX_FLAGS "-g -std=c++11 -Wall")

set(SRC_FILE_LISTS)

set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

# third party include files
include_directories(${SRC_DIR}/include)

find_package(Boost REQUIRED COMPONENTS system thread filesystem)

# add opencv
set(OpenCV_DIR ${BINARY_DIR}/share/OpenCV)
find_package(OpenCV REQUIRED)

set(Caffe_DIR ${BINARY_DIR}/share/Caffe)
find_package(Caffe REQUIRED)

# common part
include_directories(${SRC_DIR}/common)
aux_source_directory(${SRC_DIR}/common SRC_FILE_LISTS)

# main part
include_directories(${SRC_DIR}/main)
aux_source_directory(${SRC_DIR}/main SRC_FILE_LISTS)

# binary
add_executable(face-detect ${SRC_DIR}/main/fd-main.cpp ${SRC_FILE_LISTS})
# opencv
target_link_libraries(face-detect ${OpenCV_LIBRARIES})
# caffe
target_link_libraries(face-detect ${Caffe_LIBRARIES})

# utest
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/src/utest)
