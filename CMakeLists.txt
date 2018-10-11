project(vulkan-sdk)
cmake_minimum_required(VERSION 3.11)
include(ExternalProject)

find_package(Python3 COMPONENTS Interpreter Development)

if(NOT DEFINED Python3_FOUND)
    message(FATAL_ERROR "could not locate a Python 3 interpreter")
endif()

set(PYTHON_EXECUTABLE ${Python3_EXECUTABLE})

set(install_dir ${CMAKE_CURRENT_BINARY_DIR}/install)

include(vulkan-headers.cmake)
include(glslang.cmake)
include(vulkan-validationlayers.cmake)
include(spirv-tools.cmake)
include(spirv-cross.cmake)
