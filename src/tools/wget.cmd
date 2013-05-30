@echo off
setlocal enableextensions  enabledelayedexpansion 
REM ### This script downloads, installs, and executes wget
REM ### http://gnuwin32.sourceforge.net/packages/wget.htm

if not exist "%~dp0..\pkgs\wget" mkdir "%~dp0..\pkgs\wget"
if not exist "%~dp0..\pkgs\wget\wget-1.11.4-1-bin.zip" "%~dp0..\clod.cmd" clod-download-file "http://downloads.sourceforge.net/gnuwin32/wget-1.11.4-1-bin.zip" "%~dp0..\pkgs\wget\wget-1.11.4-1-bin.zip"
if not exist "%~dp0..\pkgs\wget\wget-1.11.4-1-dep.zip" "%~dp0..\clod.cmd" clod-download-file "https://downloads.sourceforge.net/project/gnuwin32/wget/1.11.4-1/wget-1.11.4-1-dep.zip" "%~dp0..\pkgs\wget\wget-1.11.4-1-dep.zip"
if not exist "%~dp0..\var\wget" mkdir "%~dp0..\var\wget"
if not exist "%~dp0..\var\wget\bin\wget.exe" "%~dp0..\clod.cmd" clod-extract-zip "%~dp0..\pkgs\wget\wget-1.11.4-1-bin.zip" "%~dp0..\var\wget"
if not exist "%~dp0..\var\wget\bin\libeay32.dll" "%~dp0..\clod.cmd" clod-extract-zip "%~dp0..\pkgs\wget\wget-1.11.4-1-dep.zip" "%~dp0..\var\wget"

"%~dp0..\var\wget\bin\wget.exe" %*

endlocal
