#!/bin/bash

PACKAGES=(
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
    "omarchy-chromium"
)

remove_package() {
    local package="$1"
    if pacman -Qi -- "$package" &>/dev/null; then
        if command -v yay &>/dev/null; then
            echo "Removing (yay): $package"
            yay -Rns --noconfirm -- "$package"
        else
            echo "Removing (pacman): $package"
            sudo pacman -Rns --noconfirm -- "$package"
        fi
    else
        echo "Not installed: $package"
    fi
}

for package in "${PACKAGES[@]}"; do
    remove_package "$package"
done
