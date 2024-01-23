@echo off
cd /d %~dp0

echo Installing Chocolatey...
call install-chocolatey.bat

echo Installing Essentials...
choco install vscode git docker-desktop -y

echo Installing ngrok...
choco install ngrok -y

echo Installing db command lines...
choco install mongodb-shell mysql-cli -y

echo Installing media tools...
choco install vidmerger ffmpeg -y

echo Installing Anaconda3...
choco install anaconda3 -y

set "ANACONDAPATH=C:\tools\Anaconda3\Scripts"
setx PATH "%ANACONDAPATH%;%PATH%"
echo Anaconda path added to system PATH.

conda install conda-forge::openjdk=17 conda-forge::maven python pip conda-forge::nodejs

git --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Installing Git...
    choco install git -y
    echo Set up Git global configuration...
    set /p git_username="Enter your Git global username: "
    set /p git_email="Enter your Git global email: "
    git config --global user.name "%git_username%"
    git config --global user.email "%git_email%"
) ELSE (
    echo Git is already installed.
)

echo All installations complete!
pause