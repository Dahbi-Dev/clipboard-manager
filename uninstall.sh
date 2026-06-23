#!/usr/bin/env bash
echo "Uninstalling Clipboard Manager..."

pkill -f clipboard-manager 2>/dev/null || true

rm -f ~/.local/bin/clipboard-manager
rm -f ~/.config/autostart/clipboard-manager.desktop

echo "Removed. History kept at ~/.config/clipboard-manager/history.json"
echo "Delete that folder too? [y/N]"
read -r answer
if [[ "$answer" =~ ^[Yy]$ ]]; then
  rm -rf ~/.config/clipboard-manager
  echo "History deleted."
fi

echo "Done."
