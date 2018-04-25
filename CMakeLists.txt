cmake_minimum_required(VERSION 3.5)
project(CMakeSample)

set(BUILD_NODEJS True CACHE BOOL "Build NodeJS")
if(${BUILD_NODEJS})
    include(cmake/SuperBuild_NodeJS.cmake)
endif(${BUILD_NODEJS})

message("NodeJS binary is installed at ${NODE_EXE_PATH}")

set(BUILD_HELLOWORLD False CACHE BOOL "Build hello.py")
if (${BUILD_HELLOWORLD})
    add_subdirectory(py)
    option(BUILD_HELLOWORLD_DEPS "Build helloworld deps" OFF)
else()
    unset(BUILD_HELLOWORLD_DEPS CACHE)
endif()
