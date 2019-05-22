# Verbose output
option(protobuf_VERBOSE "Enable for verbose output" OFF)
mark_as_advanced(protobuf_VERBOSE)

# FindProtobuf module compatibel
option(protobuf_MODULE_COMPATIBLE "CMake build-in FindProtobuf.cmake module compatible" OFF)
mark_as_advanced(protobuf_MODULE_COMPATIBLE)

option(protobuf_BUILD_LIBPROTOBUF "Build protobuf library" OFF)
option(protobuf_BUILD_LIBPROTOBUF_LITE "Build protobuf lite libraty" OFF)
option(protobuf_BUILD_PROTOC "Build proto compiler" OFF)

# No option given, default action, build all
if(NOT protobuf_BUILD_LIBPROTOBUF AND
   NOT protobuf_BUILD_LIBPROTOBUF_LITE AND
   NOT protobuf_BUILD_PROTOC)
   set(_BUILD_LIBPROTOBUF TRUE)
   set(_BUILD_LIBPROTOBUF_LITE TRUE)
   set(_BUILD_PROTOC TRUE)
endif()

if(protobuf_BUILD_LIBPROTOBUF)
    set(_BUILD_LIBPROTOBUF TRUE)
endif()

if(protobuf_BUILD_LIBPROTOBUF_LITE)
    set(_BUILD_LIBPROTOBUF_LITE TRUE)
endif()

if(protobuf_BUILD_PROTOC)
    set(_BUILD_LIBPROTOBUF TRUE)
    set(_BUILD_PROTOC TRUE)
endif()

if(_BUILD_LIBPROTOBUF AND _BUILD_LIBPROTOBUF_LITE AND _BUILD_PROTOC)
    set(_BUILD_ALL TRUE)
endif()