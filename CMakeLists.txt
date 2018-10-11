project(vulkan-sdk)
cmake_minimum_required(VERSION 3.11)
include(ExternalProject)

find_package(PythonInterp REQUIRED)

set(install_dir ${CMAKE_CURRENT_BINARY_DIR}/install)

include(vulkan-headers.cmake)
include(spirv-tools.cmake)
include(glslang.cmake)
include(vulkan-validationlayers.cmake)
include(spirv-cross.cmake)
#include(vulkan-loader.cmake)
