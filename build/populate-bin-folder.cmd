@echo off
setlocal enableextensions enabledelayedexpansion

REM ### Set up folders
rm -rf "%~dp0..\src\bin"
mkdir "%~dp0..\src\bin"
if not exist "%~dp0..\src\var" mkdir "%~dp0..\src\var"

pushd %~dp0..\src\tools
for %%F in (*.*) do (
    echo @REM ### Launch %%~nF with CLOD. > %~dp0..\src\bin\%%~nF.cmd
    echo @%%~dp0..\clod.cmd %%~nF %%* >> %~dp0..\src\bin\%%~nF.cmd
)
popd

REM ### tasks prefixed with "clod-" are internal tasks that should not be 
REM ### exposed in the bin folder.
rm -rf %~dp0..\src\bin\clod-*

endlocal
@pause