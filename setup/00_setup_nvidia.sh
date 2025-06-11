#!/usr/bin/env bash

# Nvidia drivers and utils
# https://wiki.archlinux.org/title/NVIDIA

# Check if yay is installed
if ! command -v yay 2>&1 >/dev/null
then
    echo "This script requires yay, please make sure it's installed."
    exit 1
fi

echo "Installing NVidia drivers"
yay -S nvidia nvidia-settings nvidia-util egl-wayland libva-nvidia-driver
