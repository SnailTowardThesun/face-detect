cmake_minimum_required(VERSION 2.6)

Project(face-detect-demo)

# objs
set (BINARY_DIR ${CMAKE_CURRENT_SOURCE_DIR}/objs/)
set (LIB_DIR ${CMAKE_CURRENT_SOURCE_DIR}/objs/lib)
set (EXECUTABLE_OUTPUT_PATH ${BINARY_DIR})
set (LIBRARY_OUTPUT_PATH ${LIB_DIR})

# prepare third party
if (EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/third-party/googletest-release-1.8.0)
else()
    execute_process(COMMAND "unzip" "googletest-release-1.8.0.zip"
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/third-party
        )
endif (EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/third-party/googletest-release-1.8.0)

if (EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/third-party/opencv-3.4.0)
else()
    execute_process(COMMAND "unzip" "opencv-3.4.0.zip"
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/third-party
        )
    execute_process(COMMAND "mkdir" "build"
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/third-party/opencv-3.4.0
        )
    execute_process(COMMAND "cmake" "-DCMAKE_INSTALL_PREFIX=${BINARY_DIR}" "-DCMAKE_BUILD_TYPE=Release" ".."
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/third-party/opencv-3.4.0/build
        )
    execute_process(COMMAND "make"
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/third-party/opencv-3.4.0/build
        )
    execute_process(COMMAND "make" "install"
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/third-party/opencv-3.4.0/build
        )
endif (EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/third-party/opencv-3.4.0)

if (EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/third-party/caffe-1.0)
else()
    execute_process(COMMAND "unzip" "caffe-1.0.zip"
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/third-party
        )
    execute_process(COMMAND "mkdir" "build"
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/third-party/caffe-1.0
        )
    execute_process(COMMAND "cmake" "-DCMAKE_INSTALL_PREFIX=${BINARY_DIR}" ".."
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/third-party/caffe-1.0/build
        )
    execute_process(COMMAND "make"
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/third-party/caffe-1.0/build
        )
    execute_process(COMMAND "make" "install"
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/third-party/caffe-1.0/build
        )
endif (EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/third-party/caffe-1.0)

# compile params
set(CMAKE_CXX_FLAGS "-g -std=c++11 -Wall")

set(SRC_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src)
set(SRC_FILE_LISTS)

# third party include files
include_directories(${SRC_DIR}/include)

# add opencv
# set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/third-party/opencv-3.4.0/build)
set(OpenCV_DIR ${CMAKE_CURRENT_SOURCE_DIR}/third-party/opencv-3.4.0/build)
find_package(OpenCV REQUIRED)

set(Caffe_DIR ${CMAKE_CURRENT_SOURCE_DIR}/third-party/caffe-1.0/build/)
find_package(Caffe REQUIRED)

find_package(Boost REQUIRED COMPONENTS system thread filesystem)
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
target_link_libraries(face-detect ${Boost_LIBRARIES})

# utest
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/src/utest)
