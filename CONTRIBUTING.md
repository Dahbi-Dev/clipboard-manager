# Contributing

Thanks for wanting to improve Clipboard Manager.

## Ways to contribute

- Report bugs via [GitHub Issues](../../issues)
- Request features via [GitHub Issues](../../issues)
- Submit pull requests

## Setup for development

```bash
git clone https://github.com/Dahbi-Dev/clipboard-manager.git
cd clipboard-manager

# Install dependencies
sudo apt install python3-gi xdotool
pip3 install pynput --break-system-packages

# Run directly (no install needed)
python3 clipboard-manager
```

Changes to `clipboard-manager` take effect immediately on the next run — no build step.

## Project structure

```
clipboard-manager        # single-file Python script (the whole app)
install.sh               # installer
uninstall.sh             # uninstaller
screenshots/             # images used in README
```

## Pull request checklist

- Tested on X11 (Wayland is out of scope for now)
- No new dependencies unless clearly justified
- Keeps single-file architecture — don't split into modules unless the file genuinely gets hard to read

## Good first contributions

| Idea | Difficulty |
|---|---|
| Custom hotkey in a config file | Easy |
| AppIndicator3 tray (better GNOME/KDE support) | Easy |
| Wayland support via `wl-clipboard` + `ydotool` | Medium |
| Image (screenshot) clipboard entries | Medium |
| Tags / categories for items | Medium |
| Sync history across machines | Hard |
| Encrypted storage for pinned items | Hard |

## Code style

- Python 3, no external dependencies beyond those already listed
- Keep method names short and prefixed: `_` for private, no prefix for public
- GTK calls go through `GLib.idle_add` when called from threads
