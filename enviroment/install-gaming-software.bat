@echo off
cd /d %~dp0

echo Installing Chocolatey...
call install-chocolatey.bat

echo Installing Steam...
choco install steam -y



echo Gaming applications installation complete.
pause
