# Clean Explorer

[![Release](https://img.shields.io/github/v/release/Kepners/clean-explorer?style=flat-square)](https://github.com/Kepners/clean-explorer/releases)
[![License](https://img.shields.io/github/license/Kepners/clean-explorer?style=flat-square)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-Windows%2010%20%7C%2011-blue?style=flat-square)]()

**Remove cloud drive clutter from Windows File Explorer sidebar with one click.**

Hides OneDrive, Dropbox, and other cloud storage folders from the Explorer sidebar without uninstalling or stopping sync. Everything still works - just cleaner.

<table>
<tr>
<td width="50%">

### Before 😤
![Cluttered Explorer with OneDrive and Dropbox](docs/images/before.png)
*Sidebar cluttered with cloud services*

</td>
<td width="50%">

### After ✨
![Clean Explorer without cloud clutter](docs/images/after.png)
*Clean, distraction-free sidebar*

</td>
</tr>
</table>

> 📸 **Screenshots coming soon!** See [docs/SCREENSHOT_GUIDE.md](docs/SCREENSHOT_GUIDE.md) to help contribute.

## Features

- ✅ Hide OneDrive from sidebar
- ✅ Hide Dropbox from sidebar
- ✅ One-click operation
- ✅ One-click undo (restore anytime)
- ✅ No admin rights required
- ✅ Doesn't break cloud sync
- ✅ Works on Windows 10/11

## Quick Start

### 📥 Download

**[Download Latest Release](https://github.com/Kepners/clean-explorer/releases/latest)** ⬅️ Get the ZIP here

**Two editions available:**
- 🎒 **Portable Edition** - Single file, interactive menu, runs from USB/cloud folders ([Guide](README-PORTABLE.md))
- 📦 **Standard Edition** - Traditional batch + reg files, simple and fast

Or clone the repo:
```bash
git clone https://github.com/Kepners/clean-explorer.git
```

### Hide Cloud Drives

**Option 1: One-Click Script (Recommended)**
1. Extract the downloaded ZIP
2. Double-click `Hide-CloudDrives.bat`
3. Done! Cloud drives hidden from sidebar

**Option 2: Manual Registry Files**
- Double-click `hide-onedrive.reg` to hide OneDrive
- Double-click `hide-dropbox.reg` to hide Dropbox
- Restart Explorer (or reboot)

### Restore Cloud Drives

**Option 1: One-Click Restore**
1. Double-click `Show-CloudDrives.bat`
2. Cloud drives restored to sidebar

**Option 2: Manual Registry Files**
- Double-click `show-onedrive.reg` to restore OneDrive
- Double-click `show-dropbox.reg` to restore Dropbox
- Restart Explorer (or reboot)

## What This Does

### OneDrive
- Removes OneDrive from Explorer sidebar navigation pane
- OneDrive still syncs in background
- Files remain accessible via `C:\Users\YourName\OneDrive`
- System tray icon still works

### Dropbox
- Removes Dropbox from Explorer sidebar
- Dropbox still syncs normally
- Files accessible via Dropbox folder location
- System tray icon unaffected

## How It Works

Uses Windows Registry to control which items appear in Explorer's navigation pane:

**OneDrive**: Modifies `CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}`
**Dropbox**: Removes NameSpace entries dynamically

No files deleted. No services stopped. Just cleaner UI.

## Requirements

- Windows 10 or Windows 11
- OneDrive/Dropbox installed (obviously)

## Safety

- ✅ Only modifies Explorer UI registry keys
- ✅ Doesn't touch sync settings or files
- ✅ Easily reversible
- ✅ No admin required (uses `HKEY_CURRENT_USER`)

## Troubleshooting

**Cloud drives still visible after running script?**
- Restart Windows Explorer: `Ctrl+Shift+Esc` → Processes → Windows Explorer → Restart
- Or just reboot

**Dropbox comes back after updates?**
- Run `Hide-CloudDrives.bat` again (Dropbox sometimes re-adds itself)

**Want to hide other cloud services?**
- Open an issue! I can add support for Google Drive, Box, etc.

## FAQ

**Q: Will this break my cloud sync?**
A: No. This only hides the sidebar entry. Sync continues normally.

**Q: Can I still access my files?**
A: Yes. Files remain in their original locations. Just navigate normally or use Quick Access.

**Q: Does this require admin rights?**
A: No. Uses current user registry only.

**Q: Will updates undo this?**
A: OneDrive stays hidden. Dropbox might re-add itself after major updates.

## Contributing

Found a bug? Want to add support for other cloud providers?

1. Fork the repo
2. Make your changes
3. Submit a PR

## License

MIT License - Do whatever you want with this.

## Author

Created because cloud drive sidebar clutter is annoying.

**If this saved you some frustration, star the repo!** ⭐

---

*Made with frustration and coffee. No affiliation with Microsoft, Dropbox, or any cloud provider.*
