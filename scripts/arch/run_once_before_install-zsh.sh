#!/bin/sh

sudo pacman -Sy --needed zsh zoxide fzf keychain || exit 1

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || exit 1
