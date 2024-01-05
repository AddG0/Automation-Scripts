@echo off
call ./install-chocolatey.bat

:: Install Steam
echo Installing Steam...
choco install steam -y

:: Install Riot Client
echo Installing Riot Client...
choco install riot -y

:: Add other gaming applications here...

echo Gaming applications installation complete.
pause
