# Screenshot Guide

To add screenshots to the README, we need two images:

## Before Screenshot
**Filename:** `before.png`

Capture Windows File Explorer showing:
- OneDrive in the sidebar (with cloud icon)
- Dropbox in the sidebar (with blue folder icon)
- Other default folders (This PC, Downloads, Documents)

## After Screenshot
**Filename:** `after.png`

Capture Windows File Explorer showing:
- OneDrive REMOVED from sidebar
- Dropbox REMOVED from sidebar
- Clean sidebar with just This PC and folders

## How to Capture

1. Open File Explorer
2. **Before**: Take screenshot with OneDrive and Dropbox visible
3. Run `Hide-CloudDrives.bat`
4. **After**: Take screenshot with cloud drives hidden
5. Save both as PNG files
6. Place in `docs/images/` folder

## Image Requirements
- Format: PNG
- Size: 800-1200px width recommended
- Show left sidebar clearly
- Highlight the difference

Once you have the screenshots, update README.md line 7 with:

```markdown
![Before](docs/images/before.png) | ![After](docs/images/after.png)
---|---
**Before**: Cluttered with cloud drives | **After**: Clean and simple
```
