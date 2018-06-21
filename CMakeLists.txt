project(vulkan-sdk)
cmake_minimum_required(VERSION 3.11)
include(ExternalProject)

set(install_dir ${CMAKE_CURRENT_BINARY_DIR}/install)

ExternalProject_Add(
    glslang
    SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/glslang
    CMAKE_ARGS
        -DCMAKE_INSTALL_PREFIX=${install_dir}
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    USES_TERMINAL_CONFIGURE true
    USES_TERMINAL_BUILD true
    USES_TERMINAL_INSTALL true
    USES_TERMINAL_TEST true
    BUILD_ALWAYS true
)

ExternalProject_Add(
    vulkan-headers
    SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/Vulkan-Headers
    CMAKE_ARGS
        -DCMAKE_INSTALL_PREFIX=${install_dir}
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    USES_TERMINAL_CONFIGURE true
    USES_TERMINAL_BUILD true
    USES_TERMINAL_INSTALL true
    USES_TERMINAL_TEST true
    BUILD_ALWAYS true
)

set(PYTHON_EXECUTABLE "C:/Program Files/Python35/python.exe")

ExternalProject_Add(
    vulkan-validationlayers
    DEPENDS glslang vulkan-headers
    SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/Vulkan-ValidationLayers
    CMAKE_ARGS
        -DCMAKE_INSTALL_PREFIX=${install_dir}
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
        -DVULKAN_HEADERS_INSTALL_DIR=${install_dir}
        -DGLSLANG_INSTALL_DIR=${install_dir}
        -DPYTHON_EXECUTABLE=${PYTHON_EXECUTABLE}
    USES_TERMINAL_CONFIGURE true
    USES_TERMINAL_BUILD true
    USES_TERMINAL_INSTALL true
    USES_TERMINAL_TEST true
    BUILD_ALWAYS true
)
