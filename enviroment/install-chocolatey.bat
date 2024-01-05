@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

:: Check if Chocolatey is installed
WHERE choco >nul 2>nul
IF %ERRORLEVEL% NEQ 0 (
    echo Chocolatey not found. Installing Chocolatey...
    @PowerShell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
) ELSE (
    echo Chocolatey is already installed.
)

echo Chocolatey installation complete.

ENDLOCAL