set(protoc_files
  ${protobuf_source_dir}/src/google/protobuf/compiler/main.cc
)

add_executable(protoc ${protoc_files})
target_link_libraries(protoc libprotobuf libprotoc)

install(TARGETS protoc EXPORT protobuf-targets
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR} COMPONENT protoc
)

export(TARGETS protoc
  NAMESPACE protobuf::
  APPEND FILE ${CMAKE_INSTALL_CMAKEDIR}/protobuf-targets.cmake
)
