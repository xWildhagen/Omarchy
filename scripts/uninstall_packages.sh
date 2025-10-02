#!/bin/bash

PACKAGES=(
    "1password-beta"
    "1password-cli"
    "docker"
    "docker-buildx"
    "docker-compose"
    "kdenlive"
    "lazydocker"
    "libreoffice-fresh"
    "localsend-bin"
    "obs-studio"
    "obsidian"
    "omarchy-chromium"
    "signal-desktop"
    "spotify"
    "ufw-docker"
    "xournalpp"
)

LAUNCHER_APPS=(
    "/home/wildhagen/.local/share/applications/Docker.desktop"
)

WEBAPPS=(
    "Basecamp"
    "ChatGPT"
    "Discord"
    "Figma"
    "GitHub"
    "Google Contacts"
    "Google Messages"
    "Google Photos"
    "HEY"
    "WhatsApp"
    "X"
    "YouTube"
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

remove_from_launcher() {
    local launcher_app="$1"
    if [[ -f "$launcher_app" ]]; then
        rm -r "$launcher_app"
    else
        echo "Missing: $launcher_app"
    fi
}

remove_webapp() {
    return
}

for package in "${PACKAGES[@]}"; do
    remove_package "$package"
done

for launcher_app in "${LAUNCHER_APPS[@]}"; do
    remove_from_launcher "$launcher_app"
done

for webapp in "${WEBAPPS[@]}"; do
    remove_webapp "$webapp"
done
