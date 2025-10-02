#!/bin/bash

DOTFILES=(
    "hypr/autostart.conf"
    "hypr/bindings.conf"
    "hypr/envs.conf"
    "hypr/hypridle.conf"
    "hypr/hyprland.conf"
    "hypr/hyprlock.conf"
    "hypr/hyprsunset.conf"
    "hypr/input.conf"
    "hypr/looknfeel.conf"
    "hypr/monitors.conf"
)

link_dotfile() {
    local dotfile="$1"
    local home_path="$HOME/.config/$dotfile"
    local omarchy_path="$HOME/omarchy/dotfile/$dotfile"

    ln -sf "$omarchy_path" "$home_path"
    echo "Linked: $home_path → $omarchy_path"
}

for dotfile in "${DOTFILES[@]}"; do
    link_dotfile "$dotfile"
done
