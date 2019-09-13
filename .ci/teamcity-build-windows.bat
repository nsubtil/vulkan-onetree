@rem input:
@rem %CMAKE_GENERATOR%: name of CMake generator to use
@rem %CMAKE_BUILD_TYPE%: CMake build flavor for this build
@rem %ARCH%: target architecture to build (x64 or x86)
@rem working directory is expected to be the root of the build tree

@REM echo "CMAKE_GENERATOR=%CMAKE_GENERATOR%"
@REM echo "CMAKE_BUILD_TYPE=%CMAKE_BUILD_TYPE%"
@REM echo "CMAKE_EXTRA_BUILD_ARGS=%CMAKE_EXTRA_BUILD_ARGS%"

call .ci/setup-vs2017.bat

set PYTHON_PACKAGE_PATH="%PYTHON_PATH%\Scripts"
set PATH=%CMAKE_PATH%\cmake-3.10.2-win64-x64\bin;%NINJA_PATH%;%PYTHON_PATH%;%PYTHON_PACKAGE_PATH%;%PATH%

cmake --version

echo "Generating build files"
mkdir build || exit /b 1
cd build || exit /b 1

@rem cmake -A %PLATFORM% --config %CONFIGURATION%

if "%CMAKE_GENERATOR%" == "Ninja" (
    cmake -G "%CMAKE_GENERATOR%" -DCMAKE_BUILD_TYPE="%CMAKE_BUILD_TYPE%" .. || exit /b 1
) else (
    cmake -A %ARCH% -G "%CMAKE_GENERATOR%" -DCMAKE_BUILD_TYPE="%CMAKE_BUILD_TYPE%" .. || exit /b 1
    set EXTRA_BUILD_ARGS=-- /m
)

echo "Running build"
cmake --build . --config "%CMAKE_BUILD_TYPE%" %EXTRA_BUILD_ARGS%
