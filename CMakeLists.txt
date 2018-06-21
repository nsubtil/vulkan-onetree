project(vulkan-sdk)
cmake_minimum_required(VERSION 3.11)
include(ExternalProject)

set(install_dir ${CMAKE_CURRENT_BINARY_DIR}/install)
set(PYTHON_EXECUTABLE "C:/Program Files/Python35/python.exe")

include(vulkan-headers.cmake)
include(glslang.cmake)
include(vulkan-validationlayers.cmake)
include(spirv-tools.cmake)
