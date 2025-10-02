#!/bin/bash

PACMAN_PACKAGES=(
    "1password-beta"
    "1password-cli"
)

YAY_PACKAGES=(
    ""
)

sudo pacman -Rns --noconfirm "${PACMAN_PACKAGES[@]}"

yay -Rns --noconfirm "${YAY_PACKAGES[@]}"
