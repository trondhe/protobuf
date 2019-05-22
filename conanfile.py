from conans import ConanFile, CMake, tools
import os

class ProtobufConan(ConanFile):
    name = "protobuf"
    version = "3.5.1"
    settings = "os", "compiler", "build_type", "arch"
    options = {"shared": [True, False]}
    default_options = "shared=False"
    generators = "cmake"
    exports_sources = "*" #src*", "cmake*", "gmock*", "CMakelists.txt"

    def build(self):
        cmake = CMake(self)
        cmake.definitions["protobuf_BUILD_LIBPROTOBUF_LITE"] = "On"
        #cmake.definitions["protobuf_MSVC_STATIC_RUNTIME"] = False
        cmake.configure()
        cmake.build()

    def package(self):
        cmake = CMake(self)
        cmake.install()
        
    def package_info(self):
        self.cpp_info.libs = [self.name]