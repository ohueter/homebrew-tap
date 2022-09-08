# ohueter's Homebrew Tap

My personal Homebrew tap housing formulas for my Homebrew projects.

[Homebrew](https://brew.sh) is a package manager for macOS. This tap is a "self hosted" collection of my Homebrew packages. For specific details about a formula contained in this tap, visit that formula's homepage.

## Usage

```bash
# Setup tap
brew tap ohueter/tap

# Check the tap for available formulas
brew search ohueter/tap
```

| Project                                           | Description                                       | Install                  |
| ------------------------------------------------- | ------------------------------------------------- | ------------------------ |
| [autokbisw](https://github.com/ohueter/autokbisw) | Automatic keyboard/input source switching for OSX | `brew install autokbisw` |

## Development

```bash
# Audit a formula (lint)
brew audit --strict --online <formula_name>

# Test a formula
brew test <formula_name>

# Create a tar
tar -czf name-of-tar.tar.gz path/to/content

# Get the checksum of an archive
shasum -a 256 name-of-tar.tgz

# Fix style offenses in formula
brew style --fix ohueter/tap
```
