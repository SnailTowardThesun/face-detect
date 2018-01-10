cmake_minimum_required(VERSION 2.6)

Project(utest)

set(CMAKE_CXX_FLAGS "-g -std=c++11 -Wall")

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../../third-party/googletest-release-1.8.0/googletest/include/)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../../third-party/googletest-release-1.8.0/googletest/)

add_library(gtest ${CMAKE_CURRENT_SOURCE_DIR}/../../third-party/googletest-release-1.8.0/googletest/src/gtest-all.cc)
add_library(gtest-main ${CMAKE_CURRENT_SOURCE_DIR}/../../third-party/googletest-release-1.8.0/googletest/src/gtest_main.cc)
target_link_libraries(gtest-main gtest)

set(UTEST_SRC_FILE ${CMAKE_CURRENT_SOURCE_DIR}/fd-utest-main.cpp)
include_directories(${CMAKE_CURRENT_SOURCE_DIR})
aux_source_directory(${CMAKE_CURRENT_SOURCE_DIR} UTEST_SRC_FILE)

# common part
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../common)
aux_source_directory(${CMAKE_CURRENT_SOURCE_DIR}/../common UTEST_SRC_FILE)

add_executable(utest-face-detect ${UTEST_SRC_FILE})
target_link_libraries(utest-face-detect gtest-main)
