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

APPS=(
    "Basecamp"
    "ChatGPT"
    "Discord"
    "Docker"
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

remove_app() {
    local path="$HOME/.local/share/applications"
    local app="$1"
    
    if grep -IlZ --include='*.desktop' -R "^Name=${app}$" "$path" | grep -q .; then
        grep -IlZ --include='*.desktop' -R "^Name=${app}$" "$path" | xargs -0 rm -f
        echo "Removed: $app"
    else
        echo "Missing: $app"
    fi
}

for package in "${PACKAGES[@]}"; do
    remove_package "$package"
done

for app in "${APPS[@]}"; do
    remove_app "$app"
done
