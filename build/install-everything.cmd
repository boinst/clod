@echo off
setlocal enableextensions enabledelayedexpansion

REM ###
REM ### Install all of the supported tools.
REM ### This script may be used to test the CLOD environment.
REM ### 

cmd.exe /c "%~dp0..\src\clod" 7z --help
cmd.exe /c "%~dp0..\src\clod" wget --help

endlocal