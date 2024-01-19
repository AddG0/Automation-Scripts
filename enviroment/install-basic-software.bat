@echo off
cd /d %~dp0

echo Installing Chocolatey...
call install-chocolatey.bat

echo Installing Google Chrome...
choco install googlechrome -y

echo Installing Discord...
choco install discord -y

echo Installing Spotify...
choco install spotify -y

echo Installing Notion...
choco install notion

echo Essential applications installation complete.
pause
