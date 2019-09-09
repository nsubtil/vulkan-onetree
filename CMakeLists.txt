project(vulkan-sdk)
cmake_minimum_required(VERSION 3.10.2)
enable_testing()
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

if (CMAKE_VERSION VERSION_LESS "3.12")
    # pull in FindPython3.cmake from 3.12
    list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake/FindPython3)
endif()
message("${CMAKE_MODULE_PATH}")

# some projects seem to override this to debug, which causes issues unless it's set at the top level
if (NOT CMAKE_BUILD_TYPE)
    message("CMAKE_BUILD_TYPE not set, defaulting to Debug")
    set(CMAKE_BUILD_TYPE Debug)
endif()

# this should only affect Vulkan-ValidationLayers and Vulkan-Loader
# Loader requires the WDK, which we'd rather not pull in as a dependecy
# VL requires the loader for tests
set(BUILD_TESTS OFF CACHE STRING "")

# build options for SPIRV-Tools
#set(SPIRV-Headers_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/SPIRV-Headers CACHE STRING "")
set(SKIP_SPIRV_TOOLS_INSTALL OFF CACHE STRING "")
set(SPIRV_SKIP_TESTS OFF CACHE STRING "")

# build options for shaderc
set(SHADERC_ENABLE_SHARED_CRT ON CACHE STRING "")
# xxxnsubtil: workaround for shaderc's usage of PYTHON_EXE
find_package(Python3 COMPONENTS Interpreter REQUIRED)
set(PYTHON_EXECUTABLE ${Python3_EXECUTABLE} CACHE STRING "")
set(PYTHON_EXE ${PYTHON_EXECUTABLE} CACHE STRING "")

add_subdirectory(external)

add_subdirectory(Vulkan-Headers)
add_subdirectory(SPIRV-Headers)
add_subdirectory(SPIRV-Tools)
add_subdirectory(glslang)
# xxxnsubtil: loader isn't built due to WDK dependency
# add_subdirectory(Vulkan-Loader)
add_subdirectory(Vulkan-ValidationLayers)
add_subdirectory(SPIRV-Cross)
add_subdirectory(shaderc)
