#!/bin/bash

PACMAN_PACKAGES=(
    "1password-beta"
    "1password-cli"
    "kdenlive"
    "libreoffice-fresh"
    "localsend-bin"
    "obs-studio"
    "obsidian"
    "signal-desktop"
    "spotify"
    "xournalpp"
    "docker"
    "docker-buildx"
    "docker-compose"
)

YAY_PACKAGES=(
    "omarchy-chromium"
)

sudo pacman -Rns --noconfirm "${PACMAN_PACKAGES[@]}"

yay -Rns --noconfirm "${YAY_PACKAGES[@]}"
