# Restore Dropbox to Explorer Sidebar
# Note: Dropbox usually auto-restores on next launch

Write-Host "Attempting to restore Dropbox..." -ForegroundColor Cyan

# Try to restore known CLSIDs
$dropboxCLSIDs = @(
    "{E31EA727-12ED-4702-820C-4B6445F28E1A}",
    "{EF4AB19F-049C-472E-829B-5114DDE0F8F6}"
)

$restored = $false

foreach ($clsid in $dropboxCLSIDs) {
    $path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\$clsid"
    if (-not (Test-Path $path)) {
        New-Item -Path $path -Force -ErrorAction SilentlyContinue | Out-Null
        Set-ItemProperty -Path $path -Name "(Default)" -Value "Dropbox" -ErrorAction SilentlyContinue
        $restored = $true
    }
}

if ($restored) {
    Write-Host "      SUCCESS - Dropbox restored" -ForegroundColor Green
    Write-Host "      Note: May need to restart Dropbox app" -ForegroundColor Yellow
} else {
    Write-Host "      INFO - Dropbox will auto-restore on next launch" -ForegroundColor Yellow
}
