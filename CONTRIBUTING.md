# Contributing to Clean Explorer

Thanks for considering contributing! This is a simple utility, but there's always room for improvement.

## How to Contribute

### Adding Support for Other Cloud Providers

Want to add support for Google Drive, Box, iCloud, etc.?

1. **Find the CLSID** - Use Registry Editor to find the cloud provider's namespace entry
2. **Create registry files** - Follow the pattern in `hide-onedrive.reg`
3. **Update the batch scripts** - Add the new provider to `Hide-CloudDrives.bat`
4. **Test thoroughly** - Make sure both hide and restore work
5. **Update README** - Document the new provider

### Bug Reports

Found something broken?

1. Check if it's already reported in Issues
2. Include your Windows version (10/11)
3. Include cloud app versions
4. What did you expect? What happened instead?

### Feature Requests

Got an idea?

1. Open an issue first - let's discuss before coding
2. Keep it simple - this tool is intentionally minimal
3. Must work without admin rights

## Code Style

- **Batch scripts**: Keep them readable, use echo for user feedback
- **PowerShell**: Follow Microsoft conventions, add comments
- **Registry files**: Add comments explaining what each key does

## Testing

Before submitting a PR:

1. ✅ Test hide functionality
2. ✅ Test restore functionality
3. ✅ Verify no admin rights needed
4. ✅ Check on both Windows 10 and 11 if possible
5. ✅ Make sure Explorer restarts cleanly

## Pull Request Process

1. Fork the repo
2. Create a feature branch (`git checkout -b feature/google-drive-support`)
3. Make your changes
4. Test thoroughly
5. Commit with clear messages
6. Push and create a PR

## Questions?

Open an issue or start a discussion. Happy to help!

## License

By contributing, you agree your contributions will be licensed under MIT License.
