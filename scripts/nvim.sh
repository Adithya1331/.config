#!/usr/bin/env bash
set -e  # exit on error

# Download latest Neovim release
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz

# Remove any previous Neovim install in /opt
sudo rm -rf /opt/nvim-linux-x86_64

# Extract Neovim into /opt
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

# Clean up archive
rm nvim-linux-x86_64.tar.gz

# Add Neovim to PATH (if not already added)
SHELL_CONFIG="${HOME}/.zshrc"   # change to ~/.bashrc if you use bash
if ! grep -q '/opt/nvim-linux-x86_64/bin' "$SHELL_CONFIG"; then
    echo 'export PATH="$PATH:/opt/nvim-linux-x86_64/bin"' >> "$SHELL_CONFIG"
    echo "Added Neovim to PATH in $SHELL_CONFIG"
    echo "Restart your shell or run: source $SHELL_CONFIG"
else
    echo "Neovim path already in $SHELL_CONFIG"
fi

echo "Neovim installation complete! Run 'nvim' to start."

