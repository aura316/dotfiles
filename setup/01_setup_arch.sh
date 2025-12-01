#!/usr/bin/env bash

# Script dir
DIR=$(realpath "$(dirname "$0")/..")

# Directories to create
#echo "Creating directories"
#mkdir -p ~/GDrive

# Check if sudo pacman is installed
#if ! command -v sudo pacman 2>&1 >/dev/null
#then
#    echo "This script requires sudo pacman, please make sure it's installed."
#    exit 1
#fi

# Update system packages
echo "Updating system packages..."
sudo pacman -Syu

# Display manager
# https://wiki.archlinux.org/title/Greetd
# border=magenta;text=cyan;prompt=green;time=red;action=blue;button=yellow;container=black;input=redecho "Installing DM..."
sudo pacman -S --needed ly

# Necessary packages
echo "Installing WM packages..."
sudo pacman -S --needed uwsm foot foot-terminfo hyprland hyprpaper hypridle hyprlock hyprshot hyprpicker hyprpolkitagent \
        waybar rofi-wayland wtype wl-clipboard cliphist wl-clip-persist swaync swayosd pavucontrol \
        fastfetch brightnessctl playerctl power-profiles-daemon \
        xdg-desktop-portal-hyprland xdg-desktop-portal-gtk gnome-keyring \
        bluez bluez-utils blueman networkmanager nm-connection-editor\
        scx-scheds \
        zsh zsh-syntax-highlighting zsh-autosuggestions

echo "Installing file manager"
sudo pacman -S --needed thunar thunar-volman thunar-media-tags-plugin gvfs gvfs-smb tumbler file-roller thunar-archive-plugin

echo "Installing fzf packages"
sudo pacman -S --needed fzf fd bat tree jq

# GTK and QT theme/icons
echo "Installing GTK theme, icons and cursor..."
sudo pacman -S --needed nwg-look adw-gtk-theme vimix-cursors papirus-icon-theme

# Set theme via gsettings
gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark' && gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

# Fonts
echo "Installing fonts..."
sudo pacman -S --needed ttf-noto-nerd ttf-cascadia-code-nerd ttf-cascadia-code noto-fonts noto-fonts-cjk noto-fonts-emoji

# Flatpak
# https://wiki.archlinux.org/title/Flatpak
echo "Installing flatpak..."
sudo pacman -S --needed flatpak

# Enable systemd services (managed by uwsm)
echo "Enabling system services..."
sudo systemctl enable bluetooth ly power-profiles-daemon swayosd-libinput-backend.service
echo "Enabling user services..."
systemctl --user enable hypridle hyprpaper swaync waybar hyprpolkitagent foot-server

# Symlinking
echo "Creating symlinks for configs"
ln -sfn $DIR/config/hypr ~/.config/
ln -sfn $DIR/config/rofi ~/.config/
ln -sfn $DIR/config/swaync ~/.config/
ln -sfn $DIR/config/waybar ~/.config/
ln -sfn $DIR/config/uwsm ~/.config/
ln -sfn $DIR/config/fastfetch ~/.config/
ln -sfn $DIR/config/foot ~/.config/
ln -sfn $DIR/config/zshrc ~/.zshrc
ln -sfn $DIR/scripts ~/.local/

echo
echo
echo Completed!
echo "Next steps (do these in a new shell):"
echo " - Configure monitors: https://wiki.hyprland.org/Configuring/Monitors/"
echo " - Change /etc/default/scx scheduler to scx_lavd and uncheck flags"
