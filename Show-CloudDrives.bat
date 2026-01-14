@echo off
title Clean Explorer - Restore Cloud Drives
color 0E
echo.
echo ========================================
echo   Clean Explorer - Restore Cloud Drives
echo ========================================
echo.
echo This will restore OneDrive and Dropbox
echo to your File Explorer sidebar.
echo.
pause

echo.
echo [1/3] Restoring OneDrive...
regedit /s "%~dp0show-onedrive.reg" 2>nul
if %errorlevel% equ 0 (
    echo       SUCCESS - OneDrive restored
) else (
    echo       WARNING - Check if show-onedrive.reg exists
)

echo.
echo [2/3] Restoring Dropbox...
powershell -ExecutionPolicy Bypass -File "%~dp0Restore-Dropbox.ps1"

echo.
echo [3/3] Restarting Windows Explorer...
taskkill /f /im explorer.exe >nul 2>&1
start explorer.exe

echo.
echo ========================================
echo   DONE!
echo ========================================
echo.
echo Cloud drives restored to sidebar.
echo.
timeout /t 5
