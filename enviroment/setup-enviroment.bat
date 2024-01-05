@echo off
cd /d %~dp0

echo Installing Chocolatey...
call install-chocolatey.bat

echo Installing Essentials...
choco install vscode git docker-desktop -y

echo Installing JDK 17...
choco install openjdk17 -y

echo Install awscli...
choco install awscli -y

echo Installing MySQL...
choco install mysql -y

echo Installing media tools...
choco install vidmerger ffmpeg -y

echo Installing Anaconda3...
choco install anaconda3 -y

echo All installations complete!

ENDLOCAL
pause
