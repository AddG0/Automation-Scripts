@echo off
setlocal

:: Change to the script's parent directory
cd /d "%~dp0.."

echo Listing "._" files in the parent directory and subdirectories:
DIR /B /A-D /ON /S ._* 2>nul

:: Ask for confirmation before deletion
echo.
set /p CONFIRM="Do you want to delete these files? (y/n): "
if /i "%CONFIRM%" neq "y" (
    echo Operation cancelled.
    goto End
)

echo Deleting files...
for /f "tokens=*" %%f in ('DIR /B /A-D /ON /S "%TARGET_DIR%._*" 2^>nul') do (
    del "%%f"
    echo Deleted: "%%f"
)

echo Deletion complete.

:End
endlocal
