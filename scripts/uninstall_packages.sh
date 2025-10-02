#!/bin/bash

PACKAGES=(
    "1password-beta"
    "1password-cli"
    "kdenlive"
    "libreoffice-fresh"
    "localsend-bin"
    "obs-studio"
    "obsidian"
    "omarchy-chromium"
    "signal-desktop"
    "spotify"
    "xournalpp"
    "docker"
    "docker-buildx"
    "docker-compose"
    "lazydocker"
    "ufw-docker"
)

WEBAPPS=(
    ""
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
        echo "Missing: $package"
    fi
}

remove_from_app_launcher() {
    rm -r /home/wildhagen/.local/share/applications/Docker.desktop
}

remove_webapp() {
    return
}

for package in "${PACKAGES[@]}"; do
    remove_package "$package"
done

remove_from_app_launcher

for webapp in "${WEBAPPS[@]}"; do
    remove_webapp "$webapp"
done