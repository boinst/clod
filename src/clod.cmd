@echo off

REM ###
REM ### CLOD: Command-Line On Demand version 1.0.0
REM ###

if [%1]==[activate] set Path=%Path%;%~dp0bin && exit /b 0

setlocal enableextensions enabledelayedexpansion || echo ERROR! >&2 && exit /b 1
set OD=%CD%
goto :MAIN

:USAGE
echo CLOD: Command-Line On Demand -- version 1.0.0
echo Provides command-line tools, installed on demand.
echo.
echo clod [tool] [args]
goto :END

:MAIN
set T=%1
if [%T%]==[] goto :USAGE

set TARGET_ARGS=
shift
:BUILD_TARGET_ARGUMENTS
if not [%1]==[] (
    set TARGET_ARGS=%TARGET_ARGS% "%~1"
    shift
    goto :BUILD_TARGET_ARGUMENTS
)

if exist "%~dp0bin\%T%.cmd" (
    shift
    "%~dp0bin\%T%.cmd" %*
    goto :END
)
if exist "%~dp0bin\%T%.ps1" (
    set SCRIPT=%~dp0bin\%T%.ps1
    echo !SCRIPT!
    shift
    powershell.exe -executionpolicy bypass -file "!SCRIPT!" %TARGET_ARGS%
    goto :END
)

echo ERROR: %T% is not a recognised CLOD command >&2 && exit /b 1



:END
cd /d "%OD%"
endlocal
exit /b 0

:EOF
