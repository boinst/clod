@echo off
setlocal enableextensions  enabledelayedexpansion 

REM ###
REM ### This script emulates wget
REM ### http://gnuwin32.sourceforge.net/packages/wget.htm

set OD=%CD%
cd /d "%~dp0"

if not exist "%~dp0..\pkgs\wget" mkdir "%~dp0..\pkgs\wget"
"%~dp0..\clod.cmd" clod-download-file "http://downloads.sourceforge.net/gnuwin32/wget-1.11.4-1-bin.zip" "%~dp0..\pkgs\wget\wget.zip"

@pause

:END
cd /d "%OD%"
endlocal

:EOF