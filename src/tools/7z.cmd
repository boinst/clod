@echo off
setlocal enableextensions  enabledelayedexpansion 
REM ### This script downloads, installs, and executes 7-zip
REM ### http://www.7-zip.org/

if not exist "%~dp0..\pkgs\7z" mkdir "%~dp0..\pkgs\7z"
if not exist "%~dp0..\pkgs\7z\7za920.zip" "%~dp0..\clod.cmd" clod-download-file "https://downloads.sourceforge.net/project/sevenzip/7-Zip/9.20/7za920.zip" "%~dp0..\pkgs\7z\7za920.zip"
if not exist "%~dp0..\var\7z" mkdir "%~dp0..\var\7z"
if not exist "%~dp0..\var\7z\7za.exe" "%~dp0..\clod.cmd" clod-extract-zip "%~dp0..\pkgs\7z\7za920.zip" "%~dp0..\var\7z\"

"%~dp0..\var\7z\7za.exe" %*

endlocal
