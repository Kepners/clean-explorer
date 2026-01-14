# Clean Explorer - Portable Edition
# Single-file version - runs from anywhere without extraction

param(
    [switch]$Hide,
    [switch]$Show,
    [switch]$Status
)

$ErrorActionPreference = "SilentlyContinue"

# Colors
function Write-Success { Write-Host $args -ForegroundColor Green }
function Write-Info { Write-Host $args -ForegroundColor Cyan }
function Write-Warn { Write-Host $args -ForegroundColor Yellow }

# Banner
function Show-Banner {
    Clear-Host
    Write-Host "`n========================================" -ForegroundColor Cyan
    Write-Host "   Clean Explorer - Portable Edition" -ForegroundColor Cyan
    Write-Host "========================================`n" -ForegroundColor Cyan
}

# Check OneDrive status
function Get-OneDriveStatus {
    $path = "HKCR:\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}"
    if (Test-Path $path) {
        $value = (Get-ItemProperty -Path $path -Name "System.IsPinnedToNameSpaceTree" -ErrorAction SilentlyContinue)."System.IsPinnedToNameSpaceTree"
        if ($value -eq 0) { return "Hidden" }
    }
    return "Visible"
}

# Check Dropbox status
function Get-DropboxStatus {
    $namespacePath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace"
    if (Test-Path $namespacePath) {
        $entries = Get-ChildItem $namespacePath
        foreach ($entry in $entries) {
            $value = (Get-ItemProperty -Path $entry.PSPath).'(default)'
            if ($value -like "*Dropbox*") {
                return "Visible"
            }
        }
    }
    return "Hidden"
}

# Hide OneDrive
function Hide-OneDrive {
    Write-Info "[1/2] Hiding OneDrive..."

    # Create temp reg file
    $regContent = @"
Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}]
"System.IsPinnedToNameSpaceTree"=dword:00000000

[HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}]
"System.IsPinnedToNameSpaceTree"=dword:00000000
"@

    $tempReg = "$env:TEMP\hide-onedrive.reg"
    $regContent | Out-File -FilePath $tempReg -Encoding ASCII

    Start-Process regedit -ArgumentList "/s `"$tempReg`"" -Wait
    Remove-Item $tempReg -Force

    Write-Success "      OneDrive hidden"
}

# Show OneDrive
function Show-OneDrive {
    Write-Info "[1/2] Restoring OneDrive..."

    $regContent = @"
Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}]
"System.IsPinnedToNameSpaceTree"=dword:00000001

[HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}]
"System.IsPinnedToNameSpaceTree"=dword:00000001
"@

    $tempReg = "$env:TEMP\show-onedrive.reg"
    $regContent | Out-File -FilePath $tempReg -Encoding ASCII

    Start-Process regedit -ArgumentList "/s `"$tempReg`"" -Wait
    Remove-Item $tempReg -Force

    Write-Success "      OneDrive restored"
}

# Hide Dropbox
function Hide-Dropbox {
    Write-Info "[2/2] Hiding Dropbox..."

    $found = $false
    $namespacePath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace"

    if (Test-Path $namespacePath) {
        $entries = Get-ChildItem $namespacePath
        foreach ($entry in $entries) {
            $value = (Get-ItemProperty -Path $entry.PSPath).'(default)'
            if ($value -like "*Dropbox*") {
                Remove-Item -Path $entry.PSPath -Force
                $found = $true
            }
        }
    }

    if ($found) {
        Write-Success "      Dropbox hidden"
    } else {
        Write-Info "      Dropbox not found in sidebar"
    }
}

# Show Dropbox (note: usually auto-restores)
function Show-Dropbox {
    Write-Info "[2/2] Restoring Dropbox..."
    Write-Warn "      Dropbox will auto-restore on next app launch"
}

# Restart Explorer
function Restart-Explorer {
    Write-Info "`nRestarting Windows Explorer..."
    Stop-Process -Name explorer -Force
    Start-Sleep -Milliseconds 500
    Start-Process explorer
    Write-Success "Done!`n"
}

# Show status
function Show-Status {
    Show-Banner
    $onedrive = Get-OneDriveStatus
    $dropbox = Get-DropboxStatus

    Write-Host "Current Status:" -ForegroundColor Yellow
    Write-Host "  OneDrive: $onedrive" -ForegroundColor $(if($onedrive -eq "Hidden"){"Green"}else{"Red"})
    Write-Host "  Dropbox:  $dropbox" -ForegroundColor $(if($dropbox -eq "Hidden"){"Green"}else{"Red"})
    Write-Host ""
}

# Main menu
function Show-Menu {
    Show-Banner
    Show-Status

    Write-Host "Choose an action:" -ForegroundColor Yellow
    Write-Host "  [1] Hide cloud drives" -ForegroundColor White
    Write-Host "  [2] Show cloud drives" -ForegroundColor White
    Write-Host "  [3] Check status" -ForegroundColor White
    Write-Host "  [Q] Quit`n" -ForegroundColor White

    $choice = Read-Host "Enter choice"

    switch ($choice) {
        "1" {
            Show-Banner
            Hide-OneDrive
            Hide-Dropbox
            Restart-Explorer
            Write-Host "Press any key to continue..."
            $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
            Show-Menu
        }
        "2" {
            Show-Banner
            Show-OneDrive
            Show-Dropbox
            Restart-Explorer
            Write-Host "Press any key to continue..."
            $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
            Show-Menu
        }
        "3" {
            Show-Status
            Write-Host "Press any key to continue..."
            $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
            Show-Menu
        }
        "Q" { exit }
        "q" { exit }
        default {
            Show-Menu
        }
    }
}

# Handle command line arguments
if ($Hide) {
    Show-Banner
    Hide-OneDrive
    Hide-Dropbox
    Restart-Explorer
    Start-Sleep -Seconds 3
} elseif ($Show) {
    Show-Banner
    Show-OneDrive
    Show-Dropbox
    Restart-Explorer
    Start-Sleep -Seconds 3
} elseif ($Status) {
    Show-Status
    Start-Sleep -Seconds 5
} else {
    # Interactive menu
    Show-Menu
}
