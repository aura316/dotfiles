#!/usr/bin/env bash

# Script dir
DIR=$(realpath "$(dirname "$0")/..")

# Directories to create
echo "Creating directories"
mkdir -p ~/GDrive

# Check if yay is installed
if ! command -v yay 2>&1 >/dev/null
then
    echo "This script requires yay, please make sure it's installed."
    exit 1
fi

# Update system packages
echo "Updating system packages..."
yay -Syu

# Display manager
# https://wiki.archlinux.org/title/Greetd
# border=magenta;text=cyan;prompt=green;time=red;action=blue;button=yellow;container=black;input=redecho "Installing DM..."
yay -S --needed ly

# Necessary packages
echo "Installing WM packages..."
yay -S --needed uwsm kitty hyprland hyprpaper hypridle hyprlock hyprshot hyprpicker hyprpolkitagent \
        waybar rofi-wayland rofimoji wtype wl-clipboard clipse swaync pavucontrol  \
        fastfetch brightnessctl playerctl power-profiles-daemon \
        xdg-desktop-portal xdg-desktop-portal-gtk gnome-keyring \
        thunar thunar-volman gvfs tumbler \
        bluez bluez-utils blueman nm-connection-editor\
        google-chrome code rclone \
        scx-scheds \
        zsh fzf fd zsh-syntax-highlighting zsh-autosuggestions bat \

# GTK and QT theme/icons
echo "Installing GTK theme, icons and cursor..."
yay -S --needed nwg-look qt6ct catppuccin-gtk-theme-mocha vimix-cursors papirus-icon-theme


# Fonts
echo "Installing fonts..."
yay -S --needed ttf-noto-nerd ttf-cascadia-code-nerd ttf-cascadia-code noto-fonts noto-fonts-cjk noto-fonts-emoji

# Flatpak
# https://wiki.archlinux.org/title/Flatpak
echo "Installing flatpak..."
yay -S --needed flatpak

# Enable systemd services (managed by uwsm)
echo "Enabling system services..."
sudo systemctl enable bluetooth ly power-profiles-daemon scx
echo "Enabling user services..."
systemctl --user enable hypridle hyprpaper swaync waybar hyprpolkitagent

# Symlinking
echo "Creating symlinks for configs"
ln -sfn $DIR/config/clipse ~/.config/
ln -sfn $DIR/config/hypr ~/.config/
ln -sfn $DIR/config/kitty ~/.config/
ln -sfn $DIR/config/rofi ~/.config/
ln -sfn $DIR/config/swaync ~/.config/
ln -sfn $DIR/config/waybar ~/.config/
ln -sfn $DIR/config/uwsm ~/.config/
ln -sfn $DIR/config/fastfetch ~/.config/
ln -sfn $DIR/config/qt6ct ~/.config/
ln -sfn $DIR/config/zshrc ~/.zshrc
ln -sfn $DIR/config/bin ~/.local/bin


echo
echo
echo Completed!
echo "Next steps (do these in a new shell):"
echo " - Set GTK themes (catppuccin macchiato theme / light vimix cursor / papirus-dark icon)"
echo " - Configure rclone for gdrive sync"
echo " - Configure monitors: https://wiki.hyprland.org/Configuring/Monitors/"
echo " - Run setup_flatpaks to install flatpaks"
echo " - Check flatseal permissions"
echo " - Change /etc/default/scx scheduler to scx_lavd and uncheck flags"

