@echo off
cd /d %~dp0

echo Installing Chocolatey...
call install-chocolatey.bat

echo Installing Essentials...
choco install vscode git docker-desktop -y

echo Installing JDK 17...
choco install openjdk17 maven -y

echo Install awscli...
choco install awscli -y

echo Installing MySQL...
choco install mysql -y

echo Installing media tools...
choco install vidmerger ffmpeg -y

echo Installing Anaconda3...
choco install anaconda3 -y

set "ANACONDAPATH=C:\tools\Anaconda3\Scripts"
setx PATH "%ANACONDAPATH%;%PATH%"
echo Anaconda path added to system PATH.

echo All installations complete!
pause