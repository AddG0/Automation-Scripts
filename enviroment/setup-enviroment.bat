@echo off
cd /d %~dp0

echo Installing Chocolatey...
call install-chocolatey.bat

echo Installing Essentials...
choco install vscode git docker-desktop -y

echo Installing ngrok...
choco install ngrok

echo Install awscli...
choco install awscli -y

echo Installing mongodb-shell...
choco install mongodb-shell

echo Installing media tools...
choco install vidmerger ffmpeg -y

echo Installing Anaconda3...
choco install anaconda3 -y

set "ANACONDAPATH=C:\tools\Anaconda3\Scripts"
setx PATH "%ANACONDAPATH%;%PATH%"
echo Anaconda path added to system PATH.

conda install conda-forge::openjdk=17 conda-forge::maven python pip

echo All installations complete!
pause