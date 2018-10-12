project(vulkan-sdk)
cmake_minimum_required(VERSION 3.11)
enable_testing()

# build options for SPIRV-Tools
#set(SPIRV-Headers_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/SPIRV-Headers CACHE STRING "")
set(SKIP_SPIRV_TOOLS_INSTALL OFF CACHE STRING "")
set(SPIRV_SKIP_TESTS OFF CACHE STRING "")

add_subdirectory(external)

add_subdirectory(Vulkan-Headers)
add_subdirectory(SPIRV-Headers)
add_subdirectory(SPIRV-Tools)
add_subdirectory(glslang)
add_subdirectory(SPIRV-Cross)

