@echo off
title Clean Explorer - Hide Cloud Drives
color 0A
echo.
echo ========================================
echo   Clean Explorer - Hide Cloud Drives
echo ========================================
echo.
echo This will hide OneDrive and Dropbox from
echo your File Explorer sidebar.
echo.
echo Your files and sync will NOT be affected.
echo.
pause

echo.
echo [1/3] Hiding OneDrive...
regedit /s "%~dp0hide-onedrive.reg" 2>nul
if %errorlevel% equ 0 (
    echo       SUCCESS - OneDrive hidden
) else (
    echo       WARNING - Check if hide-onedrive.reg exists
)

echo.
echo [2/3] Hiding Dropbox...
powershell -ExecutionPolicy Bypass -File "%~dp0Remove-Dropbox.ps1"

echo.
echo [3/3] Restarting Windows Explorer...
taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe

echo.
echo ========================================
echo   DONE!
echo ========================================
echo.
echo Cloud drives hidden from sidebar.
echo Your files are still syncing normally.
echo.
echo To undo: Run Show-CloudDrives.bat
echo.
timeout /t 5
