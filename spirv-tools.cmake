ExternalProject_Add(
    spirv-tools
    SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/SPIRV-Tools
    CMAKE_ARGS
        -DCMAKE_INSTALL_PREFIX=${install_dir}
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
        -DSPIRV-Headers_SOURCE_DIR=${CMAKE_CURRENT_SOURCE_DIR}/SPIRV-Headers
    USES_TERMINAL_CONFIGURE true
    USES_TERMINAL_BUILD true
    USES_TERMINAL_INSTALL true
    USES_TERMINAL_TEST true
    BUILD_ALWAYS true
)

# ExternalProject_Add_Step(
#     spirv-tools
#     copy_dep_spirv_headers
#     DEPENDERS configure build
#     COMMAND
#         ${CMAKE_COMMAND} -E copy_directory
#             ${CMAKE_CURRENT_SOURCE_DIR}/SPIRV-Headers
#             ${CMAKE_CURRENT_SOURCE_DIR}/SPIRV-Tools/external/spirv-headers
# )

ExternalProject_Add_Step(
    spirv-tools
    copy_dep_googletest
    DEPENDERS configure build
    COMMAND
        ${CMAKE_COMMAND} -E copy_directory
            ${CMAKE_CURRENT_SOURCE_DIR}/external/googletest
            ${CMAKE_CURRENT_SOURCE_DIR}/SPIRV-Tools/external/googletest
)

ExternalProject_Add_Step(
    spirv-tools
    copy_dep_effcee
    DEPENDERS configure build
    COMMAND
        ${CMAKE_COMMAND} -E copy_directory
            ${CMAKE_CURRENT_SOURCE_DIR}/external/effcee
            ${CMAKE_CURRENT_SOURCE_DIR}/SPIRV-Tools/external/effcee
)

ExternalProject_Add_Step(
    spirv-tools
    copy_dep_re2
    DEPENDERS configure build
    COMMAND
        ${CMAKE_COMMAND} -E copy_directory
            ${CMAKE_CURRENT_SOURCE_DIR}/external/re2
            ${CMAKE_CURRENT_SOURCE_DIR}/SPIRV-Tools/external/re2
)
