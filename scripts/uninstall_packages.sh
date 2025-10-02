#!/bin/bash

PACMAN_PACKAGES=(
    "visual-studio-code-bin"
)

YAY_PACKAGES=(
    "microsoft-edge-stable-bin"
)

sudo pacman -Rns --noconfirm "${PACMAN_PACKAGES[@]}"

yay -Rns --noconfirm "${YAY_PACKAGES[@]}
