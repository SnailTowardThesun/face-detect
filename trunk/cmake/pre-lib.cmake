# prepare third party

# gflags
if (EXISTS ${THIRD_PARTY_DIR}/gflags-2.2.1)
else()
    execute_process(COMMAND "unzip" "gflags-2.2.1.zip"
        WORKING_DIRECTORY ${THIRD_PARTY_DIR}
        )
    execute_process(COMMAND "mkdir" "build"
        WORKING_DIRECTORY ${THIRD_PARTY_DIR}/gflags-2.2.1
        )
    execute_process(COMMAND "cmake" "-DCMAKE_INSTALL_PREFIX=${BINARY_DIR}" "-DBUILD_SHARED_LIBS=1"  ".."
        WORKING_DIRECTORY ${THIRD_PARTY_DIR}/gflags-2.2.1/build
        )
    execute_process(COMMAND "make"
        WORKING_DIRECTORY ${THIRD_PARTY_DIR}/gflags-2.2.1/build
        )
    execute_process(COMMAND "make" "install"
        WORKING_DIRECTORY ${THIRD_PARTY_DIR}/gflgas-2.2.1/build
        )
endif (EXISTS ${THIRD_PARTY_DIR}/gflags-2.2.1)

# glog
if (EXISTS ${THIRD_PARTY_DIR}/glog-0.3.5)
else()
    execute_process(COMMAND "unzip" "glog-0.3.5.zip"
        WORKING_DIRECTORY ${THIRD_PARTY_DIR}
        )
    execute_process(COMMAND "./configure" "--prefix=${BINARY_DIR}" "LDFLAGS=-L${BINARY_DIR}/lib/" "CPPFLAGS=-I${BINARY_DIR}/include"
        WORKING_DIRECTORY ${THIRD_PARTY_DIR}/glog-0.3.5
        )
    execute_process(COMMAND "make"
        WORKING_DIRECTORY ${THIRD_PARTY_DIR}/glog-0.3.5
        )
    execute_process(COMMAND "make" "install"
        WORKING_DIRECTORY ${THIRD_PARTY_DIR}/glog-0.3.5
        )
endif (EXISTS ${THIRD_PARTY_DIR}/glog-0.3.5)

# boost
if (EXISTS ${THIRD_PARTY_DIR}/boost_1_55_0)
else()
    execute_process(COMMAND "unzip" "boost_1_55_0.zip"
        WORKING_DIRECTORY ${THIRD_PARTY_DIR}
        )
    execute_process(COMMAND "sh" "bootstrap.sh" "--prefix=${BINARY_DIR}"
        WORKING_DIRECTORY ${THIRD_PARTY_DIR}/boost_1_55_0
        )
    execute_process(COMMAND "exec" "./b2"
        WORKING_DIRECTORY ${THIRD_PARTY_DIR}/boost_1_55_0
        )
    execute_process(COMMAND "exec" "./b2" "install"
        WORKING_DIRECTORY ${THIRD_PARTY_DIR}/boost_1_55_0
        )
endif (EXISTS ${THIRD_PARTY_DIR}/boost_1_55_0)

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
    execute_process(COMMAND "cmake" "-DCMAKE_INSTALL_PREFIX=${BINARY_DIR}" ".."
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

