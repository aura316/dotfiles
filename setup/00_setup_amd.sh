#!/usr/bin/env bash
if ! command -v yay 2>&1 >/dev/null
then
    echo "This script requires yay, please make sure it's installed."
    exit 1
fi

yay -S --needed mesa vulkan-radeon lib32-mesa lib32-vulkan-radeon 


# There's an issue with AMD cards going into power saving with VRR or smtg, idk
# https://gitlab.freedesktop.org/drm/amd/-/issues/1500
echo 4 | sudo tee /sys/class/drm/card1/device/power_dpm_force_performance_level