import os
from conans import ConanFile, CMake, tools, RunEnvironment


class TestPackageConan(ConanFile):
    settings = "os", "compiler", "build_type", "arch"
    generators = "cmake"

    def build(self):
        if not tools.cross_building(self.settings):
            with tools.environment_append(RunEnvironment(self).vars):
                cmake = CMake(self, set_cmake_flags=True)
                cmake.configure()
                cmake.build()

    def test(self):
        if not tools.cross_building(self.settings):
            bin_path = os.path.abspath(os.path.join("bin", "test_package"))
            self.run(bin_path, run_environment=True)
        else:
            print("Cross compiling, can't run test_package")