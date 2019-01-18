@rem input:
@rem %CI_PROJECT_DIR%: path to root of source tree
@rem %CMAKE_GENERATOR%: name of CMake generator to use
@rem %CMAKE_BUILD_TYPE%: CMake build flavor for this build
@rem %CMAKE_EXTRA_BUILD_ARGS%: extra arguments to pass in to the build
@rem assumes the compiler environment was already set up (by calling one of setup-vs2017-x64.bat first)

@rem set up build directory
mkdir build || exit /b 1
cd build || exit /b 1

@rem configure and run
@echo on
cmake -G "%CMAKE_GENERATOR%" -DCMAKE_BUILD_TYPE="%CMAKE_BUILD_TYPE%" .. || exit / b 1
cmake --build . %EXTRA_BUILD_ARGS% || exit /b 1
