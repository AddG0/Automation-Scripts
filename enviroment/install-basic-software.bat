@echo off
call ./scripts/install-chocolatey.bat

echo Installing Google Chrome...
choco install googlechrome -y

echo Installing Discord...
choco install discord -y

echo Installing Spotify...
choco install spotify -y

echo Essential applications installation complete.
pause
