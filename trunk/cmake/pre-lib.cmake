# prepare third party

# googletest
if (EXISTS ${THIRD_PARTY_DIR}/googletest-release-1.8.0)
else()
    execute_process(COMMAND "unzip" "googletest-release-1.8.0.zip"
        WORKING_DIRECTORY ${THIRD_PARTY_DIR}
        )
endif (EXISTS ${THIRD_PARTY_DIR}/googletest-release-1.8.0)

#opencv
if (EXISTS ${THIRD_PARTY_DIR}/opencv-2.4.13.5)
else()
    execute_process(COMMAND "unzip" "opencv-2.4.13.5.zip"
        WORKING_DIRECTORY ${THIRD_PARTY_DIR}
        )
    execute_process(COMMAND "mkdir" "build"
        WORKING_DIRECTORY ${THIRD_PARTY_DIR}/opencv-2.4.13.5
        )
    execute_process(COMMAND "cmake" "-DCMAKE_INSTALL_PREFIX=${BINARY_DIR}" "-DCMAKE_BUILD_TYPE=Release" ".."
        WORKING_DIRECTORY ${THIRD_PARTY_DIR}/opencv-2.4.13.5/build
        )
    execute_process(COMMAND "make"
        WORKING_DIRECTORY ${THIRD_PARTY_DIR}/opencv-2.4.13.5/build
        )
    execute_process(COMMAND "make" "install"
        WORKING_DIRECTORY ${THIRD_PARTY_DIR}/opencv-2.4.13.5/build
        )
endif (EXISTS ${THIRD_PARTY_DIR}/opencv-2.4.13.5)

# caffe
if (EXISTS ${THIRD_PARTY_DIR}/caffe-1.0)
else()
    execute_process(COMMAND "unzip" "caffe-1.0.zip"
        WORKING_DIRECTORY ${THIRD_PARTY_DIR}
        )
    execute_process(COMMAND "mkdir" "build"
        WORKING_DIRECTORY ${THIRD_PARTY_DIR}/caffe-1.0
        )
    execute_process(COMMAND "cmake" "-DCMAKE_INSTALL_PREFIX=${BINARY_DIR}" "-DOpenCV_DIR=${BINARY_DIR}/share/OpenCV"  ".."
        WORKING_DIRECTORY ${THIRD_PARTY_DIR}/caffe-1.0/build
        )
    execute_process(COMMAND "make"
        WORKING_DIRECTORY ${THIRD_PARTY_DIR}/caffe-1.0/build
        )
    execute_process(COMMAND "make" "install"
        WORKING_DIRECTORY ${THIRD_PARTY_DIR}/caffe-1.0/build
        )
endif (EXISTS ${THIRD_PARTY_DIR}/caffe-1.0)

# move the include to src
execute_process(COMMAND "cp" "-r" "include" "${SRC_DIR}/"
    WORKING_DIRECTORY ${BINARY_DIR}
    )

