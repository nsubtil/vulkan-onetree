ExternalProject_Add(
    vulkan-validationlayers
    DEPENDS glslang vulkan-headers spirv-tools
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
