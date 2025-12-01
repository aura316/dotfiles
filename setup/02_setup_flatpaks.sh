#!/usr/bin/env bash

# Install flatpaks (<3) I use 
flatpak install com.github.rafostar.Clapper \
        dev.vencord.Vesktop \
        org.gnome.Loupe \
        com.github.tchx84.Flatseal \
        io.missioncenter.MissionCenter \
        org.gnome.gitlab.YaLTeR.VideoTrimmer \
	org.gtk.Gtk3theme.adw-gtk3 org.gtk.Gtk3theme.adw-gtk3-dark

# Apply themes to flatpak as well
sudo flatpak override --filesystem=xdg-data/themes
sudo flatpak mask org.gtk.Gtk3theme.adw-gtk3
sudo flatpak mask org.gtk.Gtk3theme.adw-gtk3-dark
