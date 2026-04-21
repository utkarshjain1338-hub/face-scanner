#!/bin/bash

echo "=========================================="
echo "    Howdy (Face Unlock) Installer"
echo "=========================================="
echo ""
echo "This script will download and install Howdy on your Debian/Parrot OS system."
echo "It requires sudo privileges."
echo ""

# Exit immediately if a command exits with a non-zero status
set -e

# Update and install dependencies
echo "[1/4] Installing dependencies..."
sudo apt-get update --fix-missing
sudo apt-get install -y --fix-missing wget gdebi-core v4l-utils

# Download Howdy .deb
echo "[2/4] Downloading Howdy..."
wget -qO /tmp/howdy.deb https://github.com/boltgolt/howdy/releases/download/v2.6.1/howdy_2.6.1.deb

# Workaround for Parrot OS mirror 404 on libtiff packages
echo "[2.5/4] Applying workaround for missing libtiff packages..."
wget -qO /tmp/libtiff6.deb "http://ftp.debian.org/debian/pool/main/t/tiff/libtiff6_4.7.0-3+deb13u2_amd64.deb"
wget -qO /tmp/libtiff-dev.deb "http://ftp.debian.org/debian/pool/main/t/tiff/libtiff-dev_4.7.0-3+deb13u2_amd64.deb"
sudo dpkg -i /tmp/libtiff6.deb /tmp/libtiff-dev.deb || true

# Install Howdy
echo "[3/4] Installing Howdy..."
echo "NOTE: During installation, it might ask you to choose between 'Fast', 'Balanced', or 'Secure' modes. 'Balanced' is recommended."
sudo apt-get install -y -f --fix-missing
sudo gdebi -n /tmp/howdy.deb || sudo apt-get install -y -f /tmp/howdy.deb

# Clean up
rm /tmp/howdy.deb

echo ""
echo "[4/4] Installation Complete!"
echo "=========================================="
echo "Next Steps:"
echo "1. Run 'sudo howdy config' to edit the configuration."
echo "   Change 'device_path = /dev/video0' to your IR camera."
echo "   (Often /dev/video0 or /dev/video2 on Dell Latitude 5400)."
echo "2. Add your face model by running: 'sudo howdy add'"
echo "3. Test it with: 'sudo howdy test'"
echo "=========================================="
