#!/usr/bin/env bash

# If not using NVidia GPU put this flag to false
NVIDIA=true
# Script dir
DIR=$(dirname -- "$0")

# Check if yay is installed
if ! command -v yay 2>&1 >/dev/null
then
    echo "This script requires yay, please make sure it's installed."
    exit 1
fi

# Nvidia drivers and utils
# https://wiki.archlinux.org/title/NVIDIA
if [ "$NVIDIA" = true ] ; then
    echo "Installing NVidia drivers"
    yay -S nvidia nvidia-settings nvidia-util egl-wayland libva-nvidia-driver
fi


# AMD specific
#yay -S amdvlk

# Update system packages
echo "Updating system packages..."
yay -Syu

# Display manager
# https://wiki.archlinux.org/title/Greetd
# border=magenta;text=cyan;prompt=green;time=red;action=blue;button=yellow;container=black;input=redecho "Installing DM..."
yay -S ly

# Necessary packages
echo "Installing WM packages..."
yay -S  uwsm kitty hyprland hyprpaper hypridle hyprlock hyprshot hyprpicker hyprpolkitagent \
        waybar rofi-wayland rofimoji wtype wl-clipboard clipse swaync pavucontrol  \
        fastfetch brightnessctl playerctl power-profiles-daemon \
        xdg-desktop-portal-hyprland xdg-desktop-portal-gtk \
        thunar thunar-volman gvfs tumbler \
        bluez bluez-utils blueman \
        google-chrome code rclone \
        system76-scheduler \

# GTK theme/icons
echo "Installing GTK theme, icons and cursor..."
yay -S nwg-look catppuccin-gtk-theme-mocha vimix-cursors papirus-icon-theme

# Fonts
echo "Installing fonts..."
yay -S ttf-noto-nerd ttf-cascadia-code-nerd ttf-cascadia-code noto-fonts noto-fonts-cjk noto-fonts-emoji

# Flatpak
# https://wiki.archlinux.org/title/Flatpak
echo "Installing flatpak..."
yay -S flatpak

# Enable systemd services (managed by uwsm)
echo "Enabling system services..."
sudo systemctl enable bluetooth ly power-profiles-daemon
echo "Enabling user services..."
systemctl --user enable hypridle hyprpaper swaync waybar

# Symlinking
echo "Creating symlinks for configs"
ln -sf $DIR/../config/clipse ~/.config/
ln -sf $DIR/../config/hypr ~/.config/
ln -sf $DIR/../config/kitty ~/.config/
ln -sf $DIR/../config/rofi ~/.config/
ln -sf $DIR/../config/swaync ~/.config/
ln -sf $DIR/../config/waybar ~/.config/
ln -sf $DIR/../config/uwsm ~/.config/
ln -sf $DIR/../config/fastfetch ~/.config/


echo "Completed! Next steps (do these in a new shell):" \
      " - Set GTK themes (catppuccin macchiato theme / light vimix cursor / papirus-dark icon)" \
      " - Configure rclone for gdrive sync" \
      " - Configure monitors: https://wiki.hyprland.org/Configuring/Monitors/" \
      " - Run setup_flatpaks to install flatpaks" \
      " - Check flatseal permissions"

