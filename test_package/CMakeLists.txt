cmake_minimum_required(VERSION 3.10)
project(test_package)

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

set(CMAKE_VERBOSE_MAKEFILE ON)

find_package(protobuf CONFIG REQUIRED)
message(STATUS "Using Protocol Buffers ${protobuf_VERSION}")
set(CMAKE_INCLUDE_CURRENT_DIR TRUE)

# Generate header and source files from proto
add_library(proto_target messages.proto)
target_link_libraries(proto_target protobuf::libprotobuf)
protobuf_generate(TARGET proto_target)

# Test generated files
add_executable(test_package test_protobuf.cpp)
target_link_libraries(test_package PRIVATE proto_target)