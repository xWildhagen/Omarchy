#!/bin/bash

PACMAN_PACKAGES=(
    "visual-studio-code-bin"
)

YAY_PACKAGES=(
    "microsoft-edge-stable-bin"
)

sudo pacman -Syu --noconfirm

sudo pacman -S --noconfirm --needed "${PACMAN_PACKAGES[@]}"

yay -S --noconfirm --needed "${YAY_PACKAGES[@]}"