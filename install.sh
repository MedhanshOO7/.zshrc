#!/usr/bin/env bash

set -e

ZSH_CONFIG_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_ZSHRC="$HOME/.zshrc"
TARGET_ZSH_DIR="$HOME/.zsh"

echo "Installing Zsh Configs..."

# Backup existing .zshrc
if [ -f "$TARGET_ZSHRC" ] || [ -L "$TARGET_ZSHRC" ]; then
    echo "Backing up existing .zshrc to .zshrc.bak"
    mv "$TARGET_ZSHRC" "$TARGET_ZSHRC.bak"
fi

# Backup existing .zsh directory
if [ -d "$TARGET_ZSH_DIR" ] || [ -L "$TARGET_ZSH_DIR" ]; then
    echo "Backing up existing .zsh directory to .zsh.bak"
    mv "$TARGET_ZSH_DIR" "$TARGET_ZSH_DIR.bak"
fi

echo "Creating symlinks..."
ln -s "$ZSH_CONFIG_DIR/.zshrc" "$TARGET_ZSHRC"
ln -s "$ZSH_CONFIG_DIR/.zsh" "$TARGET_ZSH_DIR"

echo "Installation complete! Please restart your terminal or run 'exec zsh'."
