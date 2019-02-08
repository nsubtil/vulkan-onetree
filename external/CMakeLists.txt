# xxxnsubtil: a lot of this script is lifted from SPIRV-Tools/external/CMakeLists.txt
# we may want to move this back into separate .cmake files that live in SPIRV-Tools instead
# so that we don't have to maintain the setup script in two places

# set up googletest + googlemock
if(WIN32)
    option(gtest_force_shared_crt
           "Use shared (DLL) run-time lib even when Google Test is built as static lib."
           ON)
endif()

set(GTEST_IS_STATIC_LIB TRUE CACHE STRING "googletest is built as a static library")
set(INSTALL_GTEST OFF CACHE STRING "")
set(INSTALL_GMOCK OFF CACHE STRING "")
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/googletest/googlemock EXCLUDE_FROM_ALL)
if(MSVC)
    # Our tests use ::testing::Combine.  Work around a compiler
    # detection problem in googletest, where that template is
    # accidentally disabled for VS 2017.
    # See https://github.com/google/googletest/issues/1352
    target_compile_definitions(gmock PUBLIC -DGTEST_HAS_COMBINE=1)
endif()
foreach(target gtest gtest_main gmock gmock_main)
    set_property(TARGET ${target} PROPERTY FOLDER "external/GoogleTest")
endforeach()

# set up re2
set(RE2_BUILD_TESTING OFF CACHE STRING "Run RE2 Tests")
set(RE2_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/external/re2" CACHE STRING "RE2 source dir")
add_subdirectory(re2)
# turn off warnings for re2
set_property(TARGET re2 APPEND PROPERTY COMPILE_OPTIONS -w)
set_property(TARGET re2 PROPERTY FOLDER "external/re2")

# set up effcee
# SPIRV-Tools uses the shared CRT with MSVC. Tell Effcee to do the same
set(EFFCEE_ENABLE_SHARED_CRT ON CACHE STRING "")
set(EFFCEE_BUILD_TESTING OFF CACHE STRING "")
set(EFFCEE_BUILD_SAMPLES OFF CACHE STRING "")
add_subdirectory(effcee)
set_property(TARGET effcee PROPERTY FOLDER Effcee)
# turn off warnings for effcee
set_property(TARGET effcee APPEND PROPERTY COMPILE_OPTIONS -w)
set_property(TARGET effcee PROPERTY FOLDER "external/Effcee")
