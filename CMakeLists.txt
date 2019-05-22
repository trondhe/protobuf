cmake_minimum_required(VERSION 3.12 FATAL_ERROR)
project(protobuf_conanwrap CXX)
include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()
message("Protobuf wrapper")
add_subdirectory(cmake)

