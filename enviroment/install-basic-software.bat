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
conda install conda-forge::notion-client

echo Essential applications installation complete.
pause
