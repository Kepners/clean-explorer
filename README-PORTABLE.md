# Clean Explorer - Portable Edition

**Single-file version that runs from anywhere!**

## What is Portable Edition?

The portable edition is a self-contained PowerShell script that:
- ✅ Runs from USB drives
- ✅ Runs from cloud-synced folders (Dropbox, OneDrive, Google Drive)
- ✅ No extraction needed
- ✅ No installation required
- ✅ Interactive menu interface
- ✅ Command-line support

## Quick Start

### Option 1: Interactive Menu (Easiest)
1. Download `CleanExplorer-Portable.bat`
2. Double-click it from anywhere
3. Choose from menu:
   - `[1]` Hide cloud drives
   - `[2]` Show cloud drives
   - `[3]` Check status

### Option 2: Command Line
**Hide cloud drives:**
```powershell
.\CleanExplorer-Portable.ps1 -Hide
```

**Show cloud drives:**
```powershell
.\CleanExplorer-Portable.ps1 -Show
```

**Check status:**
```powershell
.\CleanExplorer-Portable.ps1 -Status
```

## Features

- 🎯 **Single file** - No dependencies or extraction
- 📁 **Run from anywhere** - USB, network drive, cloud folder
- 📊 **Status checking** - See current state of cloud drives
- 🎨 **Interactive menu** - Easy to use interface
- ⚡ **Fast** - Executes in seconds
- 🔒 **Safe** - All registry changes are temporary and reversible

## Use Cases

### USB Drive Tech Support
1. Copy `CleanExplorer-Portable.ps1` to USB
2. Plug into any Windows PC
3. Run it to clean up Explorer
4. No traces left behind

### Cloud-Synced Utilities Folder
1. Save to `Dropbox\Tools\CleanExplorer-Portable.ps1`
2. Access from any of your synced PCs
3. Always up-to-date across devices

### Network Admin
1. Place on network share
2. Users can run directly from share
3. No installation, no IT ticket needed

## Comparison

| Feature | Portable | Standard |
|---------|----------|----------|
| Single file | ✅ | ❌ (7 files) |
| Interactive menu | ✅ | ❌ |
| Status checking | ✅ | ❌ |
| Run from USB | ✅ | ✅ |
| Command line | ✅ | ✅ |
| File size | ~6 KB | ~15 KB total |

## Requirements

- Windows 10 or 11
- PowerShell (built-in)
- Admin rights (for registry access)

## Technical Details

The portable script:
1. Creates temporary `.reg` files in `%TEMP%`
2. Applies registry changes
3. Cleans up temp files
4. Restarts Explorer automatically

No permanent files created. No traces left.

## Troubleshooting

**Script won't run?**
- Right-click → "Run with PowerShell"
- Or use the `.bat` launcher

**PowerShell execution policy blocked?**
The `.bat` launcher handles this automatically with `-ExecutionPolicy Bypass`

**Need admin rights?**
The `.bat` launcher auto-elevates if needed

## Download

Get the portable version from [Releases](https://github.com/Kepners/clean-explorer/releases/latest)

Or copy-paste the PowerShell script directly - it's just text!

---

**Portable edition:** Perfect for IT admins, tech support, and power users who need a tool that travels with them.
