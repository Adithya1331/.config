#!/usr/bin/env bash
set -e  # exit on error

# Install Node.js + npm from apt
sudo apt update
sudo apt install -y nodejs npm

# Configure npm global install path
npm config set prefix ~/.local/npm

# Ensure npm global bin is on PATH
SHELL_CONFIG="${HOME}/.zshrc"   # change to ~/.bashrc if you use bash
if ! grep -q 'export PATH="$PATH:$HOME/.local/npm/bin"' "$SHELL_CONFIG"; then
	    echo 'export PATH="$PATH:$HOME/.local/npm/bin"' >> "$SHELL_CONFIG"
	        echo "Added npm global bin path to $SHELL_CONFIG"
fi

# Set N_PREFIX so 'n' installs Node versions in ~/.local/n
if ! grep -q 'export N_PREFIX' "$SHELL_CONFIG"; then
	    echo 'export N_PREFIX="$HOME/.local/n"' >> "$SHELL_CONFIG"
	        echo 'export PATH="$N_PREFIX/bin:$PATH"' >> "$SHELL_CONFIG"
		    echo "Added N_PREFIX config to $SHELL_CONFIG"
fi

# Apply changes immediately
export PATH="$HOME/.local/npm/bin:$PATH"
export N_PREFIX="$HOME/.local/n"
export PATH="$N_PREFIX/bin:$PATH"

# Install 'n' (Node version manager) globally
npm install -g n

# Install the latest LTS version of Node.js
n lts

