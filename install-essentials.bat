@echo off
call ./scripts/install-chocolatey.bat

:: Install Google Chrome
echo Installing Google Chrome...
choco install googlechrome -y

:: Install Discord
echo Installing Discord...
choco install discord -y

:: Install Spotify
echo Installing Spotify...
choco install spotify -y

echo Essential applications installation complete.
pause
