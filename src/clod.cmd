@echo off

REM ###
REM ### CLOD: Command-Line On Demand version 1.0.0
REM ###

REM ### Just calling "clod activate" appends clod's "bin" folder 
REM ### to the system Path. Many (not all) of clod's commands will 
REM ### be made available this way.
if [%1]==[activate] set Path=%Path%;%~dp0bin && exit /b 0

setlocal enableextensions enabledelayedexpansion || echo ERROR! >&2 && exit /b 1
set OD=%CD%
if [%1]==[--help] goto :USAGE
if [%1]==[/?] goto :USAGE
if [%1]==[-h] goto :USAGE
if [%1]==[help] goto :USAGE
if [%1]==[] goto :USAGE
goto :MAIN

:USAGE
REM ###
REM ### Provide usage information
REM ###
echo CLOD: Command-Line On Demand -- version 1.0.0
echo Provides command-line tools, installed on demand.
echo.
echo clod [tool] [args]
goto :END

:MAIN
set TARGET=%1
set CLODDIR=%~dp0

REM ### Build a list of arguments to pass to the tool.
REM ### The first argument is the name of the tool, so we want
REM ### to skip the first argument and pass on the rest.
set TARGET_ARGS=
:BUILD_TARGET_ARGUMENTS
if not [%2]==[] (
    set TARGET_ARGS=%TARGET_ARGS% %~2
    shift
    goto :BUILD_TARGET_ARGUMENTS
)

REM ### Resolve the appropriate script and execute it.
if exist "%CLODDIR%bin\%TARGET%.cmd" (
    shift
    "%CLODDIR%bin\%TARGET%.cmd" %*
    goto :END
)
if exist "%CLODDIR%scripts\%TARGET%.ps1" (
    set SCRIPT=%CLODDIR%scripts\%TARGET%.ps1
    shift
    powershell.exe -executionpolicy bypass -file "!SCRIPT!" %TARGET_ARGS%
    goto :END
)

REM ### We didn't find any matching tool
echo ERROR: "%TARGET%" is not CLOD command >&2 && exit /b 1

:END
cd /d "%OD%"
endlocal
exit /b 0

:EOF
