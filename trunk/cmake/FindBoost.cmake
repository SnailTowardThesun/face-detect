# for boost 1.55

set(Boost_FOUND 1)
set(Boost_MAJOR_VERSION 1)
set(Boost_MINOR_VERSION 55)

find_path(Boost_INCLUDE_DIR
    NAMES boost/config.hpp
    HINTS ${SRC_DIR}/include
    )

set(Boost_LIBRARY "")

find_library(Boost_Libraries_Thread
    NAMES boost_thread
    HINTS ${LIB_DIR}
    )
list(APPEND Boost_LIBRARY ${Boost_Libraries_Thread})

find_library(Boost_Libraries_System
    NAMES boost_system
    HINTS ${LIB_DIR}
    )
list(APPEND Boost_LIBRARY ${Boost_Libraries_System})

find_library(Boost_Libraries_FileSystem
    NAMES boost_filesystem
    HINTS ${LIB_DIR}
    )
list(APPEND Boost_LIBRARY ${Boost_Libraries_System})

set(Boost_LIBRARIES ${Boost_LIBRARY})
set(Boost_INCLUDE_DIRS ${Boost_INCLUDE_DIR})
