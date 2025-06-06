#!/usr/bin/env bash

# Steam installed as a system library alongside gamescope so they dont run into sandboxing issues
# https://wiki.archlinux.org/title/Steam
yay -S steam \
       ttf-liberations \
       gamescope \
       vulkan-tools \

# Helper stuff
# Protontricks, bottles, gamescope, scopebuddy

# Scopebuddy: Helper for gamescope settings
sudo curl -Lo /usr/local/bin/scopebuddy https://raw.githubusercontent.com/HikariKnight/ScopeBuddy/refs/heads/main/bin/scopebuddy
sudo chmod +x /usr/local/bin/scopebuddy
sudo ln -s scopebuddy /usr/local/bin/scb