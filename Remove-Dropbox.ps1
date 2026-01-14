# Remove Dropbox from Explorer Sidebar
# Safe: Only removes UI entry, does not affect sync

Write-Host "Searching for Dropbox in Explorer sidebar..." -ForegroundColor Cyan

# Common Dropbox CLSIDs (varies by version/user)
$dropboxCLSIDs = @(
    "{E31EA727-12ED-4702-820C-4B6445F28E1A}",
    "{EF4AB19F-049C-472E-829B-5114DDE0F8F6}",
    "{6D8F2C5F-97D0-4D13-8C92-7BFDD38A9244}"
)

$found = $false

# Try known CLSIDs first
foreach ($clsid in $dropboxCLSIDs) {
    $path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\$clsid"
    if (Test-Path $path) {
        Remove-Item -Path $path -Force -ErrorAction SilentlyContinue
        Write-Host "      Removed Dropbox ($clsid)" -ForegroundColor Green
        $found = $true
    }
}

# Search all NameSpace entries for Dropbox
$namespacePath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace"
if (Test-Path $namespacePath) {
    $entries = Get-ChildItem $namespacePath -ErrorAction SilentlyContinue
    foreach ($entry in $entries) {
        $value = (Get-ItemProperty -Path $entry.PSPath -ErrorAction SilentlyContinue).'(default)'
        if ($value -like "*Dropbox*") {
            Remove-Item -Path $entry.PSPath -Force -ErrorAction SilentlyContinue
            Write-Host "      Removed Dropbox entry" -ForegroundColor Green
            $found = $true
        }
    }
}

if ($found) {
    Write-Host "      SUCCESS - Dropbox hidden" -ForegroundColor Green
} else {
    Write-Host "      INFO - Dropbox not found in sidebar" -ForegroundColor Yellow
}
