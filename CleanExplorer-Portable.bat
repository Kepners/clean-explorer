@echo off
:: Clean Explorer - Portable Launcher
:: Runs from anywhere without installation

title Clean Explorer - Portable
color 0B

:: Self-elevate if needed (for HKCR registry access)
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting admin rights for registry access...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: Run the portable PowerShell script
powershell -ExecutionPolicy Bypass -File "%~dp0CleanExplorer-Portable.ps1"
