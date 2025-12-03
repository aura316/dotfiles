#!/usr/bin/env bash

# Script dir
DIR=$(realpath "$(dirname "$0")/..")

# Nvidia drivers and utils
# https://wiki.archlinux.org/title/NVIDIA

echo "Installing NVidia drivers"
sudo pacman -S --needed nvidia nvidia-utils egl-wayland libva-nvidia-driver

ln -sfn $DIR/config/uwsm/env-nvidia $DIR/config/uwsm/env
