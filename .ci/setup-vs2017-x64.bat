@rem sets up env variables for installed MSVC2017
@rem based on https://github.com/Microsoft/vswhere/wiki/Examples

set VSCMD_START_DIR=%CI_PROJECT_DIR%

for /f "usebackq tokens=1* delims=: " %%i in (`%CI_PROJECT_DIR%/.ci/vswhere.exe -version 15 -requires Microsoft.VisualStudio.Workload.NativeDesktop`) do (
    if /i "%%i"=="installationPath" set VS2017DIR=%%j
)

call "%VS2017DIR%\Common7\Tools\VsDevCmd.bat" -arch=x64
