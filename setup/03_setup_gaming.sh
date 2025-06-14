#!/usr/bin/env bash

# Steam installed as a system library alongside gamescope so they dont run into sandboxing issues
# https://wiki.archlinux.org/title/Steam
yay -S steam \
       ttf-liberation \
       gamescope \
       vulkan-tools \

# Helper stuff
# Protontricks, bottles, gamescope, scopebuddy
flatpak install flathub com.github.Matoking.protontricks net.davidotek.pupgui2


# XLM for XIV
# https://github.com/Blooym/XLM
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Blooym/xlm/main/setup/install-native.sh)"

# Scopebuddy: Helper for gamescope settings
sudo curl -Lo /usr/local/bin/scopebuddy https://raw.githubusercontent.com/HikariKnight/ScopeBuddy/refs/heads/main/bin/scopebuddy
sudo chmod +x /usr/local/bin/scopebuddy
sudo ln -s scopebuddy /usr/local/bin/scb
