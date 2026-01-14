# Installation Guide

## Download

### Option 1: Download Release ZIP (Recommended)
1. Go to [Releases](https://github.com/Kepners/clean-explorer/releases/latest)
2. Download `CleanExplorer-v1.0.0.zip`
3. Extract to any folder (Desktop, Downloads, wherever)
4. You're ready to go!

### Option 2: Clone Repository
```bash
git clone https://github.com/Kepners/clean-explorer.git
cd clean-explorer
```

## Usage

### Hide Cloud Drives
**Double-click:** `Hide-CloudDrives.bat`

The script will:
1. Hide OneDrive from Explorer sidebar
2. Hide Dropbox from Explorer sidebar
3. Restart Windows Explorer
4. Done in ~5 seconds!

### Restore Cloud Drives
**Double-click:** `Show-CloudDrives.bat`

Brings back OneDrive and Dropbox to the sidebar.

## Manual Method (Advanced Users)

If you prefer to do it manually:

**Hide OneDrive:**
1. Double-click `hide-onedrive.reg`
2. Click "Yes" when prompted
3. Restart Explorer

**Hide Dropbox:**
1. Right-click `Remove-Dropbox.ps1`
2. Select "Run with PowerShell"
3. Restart Explorer

**Restore:**
- OneDrive: Double-click `show-onedrive.reg`
- Dropbox: Run `Restore-Dropbox.ps1`

## Troubleshooting

**Cloud drives still visible?**
- Restart Explorer: Press `Ctrl+Shift+Esc` → Find "Windows Explorer" → Right-click → Restart
- Or just reboot your PC

**PowerShell scripts blocked?**
- Right-click the `.ps1` file → Properties → Check "Unblock" → OK
- Or run as admin: `powershell -ExecutionPolicy Bypass -File Remove-Dropbox.ps1`

**Dropbox comes back after updates?**
- This is normal - Dropbox re-adds itself sometimes
- Just run `Hide-CloudDrives.bat` again

## Uninstall

There's nothing to uninstall! Just delete the folder.

If you want to restore cloud drives first:
1. Run `Show-CloudDrives.bat`
2. Delete the CleanExplorer folder

## System Requirements

- **OS**: Windows 10 or Windows 11
- **Permissions**: No admin rights needed
- **Cloud Apps**: OneDrive and/or Dropbox installed

## Security

All scripts are open source. Feel free to review:
- Registry changes only affect Explorer UI
- No system files modified
- No network connections
- No data collection
- Completely local operation

## Questions?

Open an [issue](https://github.com/Kepners/clean-explorer/issues) or check the main [README](README.md).
