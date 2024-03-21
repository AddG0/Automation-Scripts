@echo off
setlocal

:: Check if a port number is provided
if "%~1"=="" (
    echo Usage: %0 [port number]
    exit /b 1
)

set PORT=%1

:: Find processes using the port
for /f "tokens=5" %%a in ('netstat -aon ^| findstr :%PORT%') do (
    set PID=%%a
    goto :found
)

:notfound
    echo No process found running on port %PORT%.
    exit /b 0

:found
    echo Processes running on port %PORT%:
    netstat -aon ^| findstr :%PORT%

:: Ask for confirmation
set /p REPLY="Are you sure you want to kill these processes? (y/n) "
if /i "%REPLY%"=="y" (
    echo Killing processes on port %PORT%...
    taskkill /F /PID %PID%
    echo Done.
) else (
    echo Operation cancelled.
)

endlocal