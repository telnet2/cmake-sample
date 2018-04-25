cmake_minimum_required(VERSION 3.5)
project(CMakeSample)

set(BUILD_NODEJS True CACHE BOOL "Build NodeJS")
if(${BUILD_NODEJS})
    include(cmake/SuperBuild_NodeJS.cmake)
endif(${BUILD_NODEJS})


