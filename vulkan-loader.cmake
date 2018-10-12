ExternalProject_Add(
    vulkan-loader
    DEPENDS vulkan-headers
    SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/Vulkan-Loader
    CMAKE_ARGS
        -DCMAKE_INSTALL_PREFIX=${install_dir}
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
        -DVULKAN_HEADERS_INSTALL_DIR=${install_dir}
        -DPYTHON_EXECUTABLE=${PYTHON_EXECUTABLE}
    USES_TERMINAL_CONFIGURE true
    USES_TERMINAL_BUILD true
    USES_TERMINAL_INSTALL true
    USES_TERMINAL_TEST true
    BUILD_ALWAYS true
)

ExternalProject_Add_Step(
    vulkan-loader
    copy_dep_googletest
    DEPENDERS configure
    COMMAND
        ${CMAKE_COMMAND} -E copy_directory
            ${CMAKE_CURRENT_SOURCE_DIR}/external/googletest
            ${CMAKE_CURRENT_SOURCE_DIR}/Vulkan-Loader/external/googletest
)
