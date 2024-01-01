@echo off
call ./scripts/install-chocolatey.bat

echo Installing Docker...
choco install docker-desktop -y

echo Installing MySQL...
choco install mysql -y

echo Installing Git...
choco install git -y

echo Installing Visual Studio Code...
choco install vscode -y

echo Installing JDK 17...
choco install openjdk17 -y

echo Installing ffmpeg...
choco install ffmpeg

echo Installing gpac...
choco install gpac

echo Installing vidmerger
choco install vidmerger

echo Install Anaconda3...
choco install anaconda3

echo Install ngrok...
choco install ngrok

echo All installations complete!

ENDLOCAL
pause
