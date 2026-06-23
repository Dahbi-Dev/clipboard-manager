#!/usr/bin/env bash
set -e

echo "Installing Clipboard Manager..."

# Dependencies
echo "→ Installing system dependencies..."
sudo apt-get install -y python3-gi xdotool 2>/dev/null || true

echo "→ Installing pynput..."
pip3 install pynput --break-system-packages --quiet 2>/dev/null || \
  pip3 install pynput --quiet 2>/dev/null || true

# Binary
echo "→ Copying binary..."
mkdir -p ~/.local/bin
cp clipboard-manager ~/.local/bin/clipboard-manager
chmod +x ~/.local/bin/clipboard-manager

# Make sure ~/.local/bin is on PATH
if ! echo "$PATH" | grep -q "$HOME/.local/bin"; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
  export PATH="$HOME/.local/bin:$PATH"
fi

# Autostart
echo "→ Creating autostart entry..."
mkdir -p ~/.config/autostart
cat > ~/.config/autostart/clipboard-manager.desktop <<EOF
[Desktop Entry]
Type=Application
Name=Clipboard Manager
Comment=Background clipboard history tool (Win+V)
Exec=$HOME/.local/bin/clipboard-manager
Icon=edit-paste
Terminal=false
Hidden=false
X-GNOME-Autostart-enabled=true
StartupNotify=false
EOF

# Config dir
mkdir -p ~/.config/clipboard-manager

# Launch
echo "→ Launching..."
pkill -f clipboard-manager 2>/dev/null || true
sleep 0.3
nohup ~/.local/bin/clipboard-manager > /dev/null 2>&1 &

echo ""
echo "Done! Clipboard Manager is running."
echo "Press Win+V to open it."
