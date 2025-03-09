#!/bin/sh

sudo pacman -Sy --needed git tmux || exit 1

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm || exit 1
