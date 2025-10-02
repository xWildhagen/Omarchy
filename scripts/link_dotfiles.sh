#!/bin/bash

DOTFILES=(
    ""
    ".config/hypr/autostart.conf"
    ".config/hypr/bindings.conf"
    ".config/hypr/envs.conf"
    ".config/hypr/hypridle.conf"
    ".config/hypr/hyprland.conf"
    ".config/hypr/hyprlock.conf"
    ".config/hypr/hyprsunset.conf"
    ".config/hypr/input.conf"
    ".config/hypr/looknfeel.conf"
    ".config/hypr/monitors.conf"
)

link_dotfile() {
    local dotfile="$1"
    local home_path="$HOME/$dotfile"
    local omarchy_path="$HOME/omarchy/dotfiles/$dotfile"

    ln -sf "$omarchy_path" "$home_path"
    echo "Linked: $home_path → $omarchy_path"
}

for dotfile in "${DOTFILES[@]}"; do
    link_dotfile "$dotfile"
done
