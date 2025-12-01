#!/usr/bin/env bash

# Script dir
DIR=$(realpath "$(dirname "$0")/..")

sudo pacman -S --needed mesa vulkan-radeon lib32-mesa lib32-vulkan-radeon

# There's an issue with AMD cards going into power saving with VRR or smtg, idk
# https://gitlab.freedesktop.org/drm/amd/-/issues/1500
echo 4 | sudo tee /sys/class/drm/card1/device/power_dpm_force_performance_level

ln -sfn $DIR/config/uwsm/env-amd ~/.config/uwsm/env
