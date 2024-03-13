@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

:: Get the full path of the directory the script is in
SET "scriptDir=%~dp0"

:: Set the relative path to your 'Drives' directory
SET "driveFolderPath=%scriptDir%..\..\"

:: Convert to absolute path and remove trailing backslash
FOR /F "delims=" %%i IN ("%driveFolderPath%") DO SET "driveFolderPath=%%~fi"

:: Navigate to the 'Drives' directory
cd /d %driveFolderPath%

:: Check if the directory change was successful
IF %ERRORLEVEL% NEQ 0 (
    echo Failed to navigate to '%driveFolderPath%'. Please check the path and try again.
    goto EndScript
)

:: Recursively find and add directories containing a .git folder
echo Adding directories containing a .git folder to Git safe.directory...
FOR /R %%D IN (.) DO (
    IF EXIST "%%D\.git" (
        SET "dirPath=%%~fD"
        SET "dirPath=!dirPath:\=/!"
        git config --global --add safe.directory "!dirPath!"
    )
)

:: End of script
:EndScript
echo.
echo Operation completed.
pause

ENDLOCAL