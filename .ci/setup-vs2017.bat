@rem sets up env variables for installed MSVC2017
@rem based on https://github.com/Microsoft/vswhere/wiki/Examples

set VSWHERE="%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe"
if not exist %VSWHERE% (
    echo "vswhere.exe not found --- is VS2017 installed?"
    exit 1
)

if "%ARCH%" == "x64" (
    set VSARCH=amd64
) else (
    set VSARCH=%ARCH%
)

for /f "usebackq tokens=1* delims=: " %%i in (`%VSWHERE% -version 15 -requires Microsoft.VisualStudio.Workload.NativeDesktop`) do (
    if /i "%%i"=="installationPath" set VS2017DIR=%%j
)

call "%VS2017DIR%\Common7\Tools\VsDevCmd.bat" -arch=%VSARCH% -startdir=none
