# Hyprconfig

This directory contains configuration files and scripts for customizing the Hyprland window manager environment.

## Contents

- `style.css`: Custom styles for Waybar, the status bar used with Hyprland.
- `hyprrepair.sh`: Script to update, repair, or rebuild Hyprland and related packages.
- Other configuration files for Hyprland and its ecosystem.

## Usage

- Edit the configuration files to personalize your Hyprland setup.
- Run `hyprrepair.sh` to update or repair your Hyprland installation.

## Notes

- These files are intended for use with Arch Linux and Hyprland.
- Make sure to back up your configuration before making major changes.

## Installation

1. Clone or copy this directory to your Hyprland config location:
   ```sh
   git clone <repo-url> ~/.config/hypr
   # or copy the files manually
   ```
2. Install Hyprland and dependencies (Arch Linux):
   ```sh
   sudo pacman -S hyprland waybar
   # Or use the provided hyprrepair.sh script for a custom build and extra packages
   chmod +x ~/.config/hypr/hyprrepair.sh
   ~/.config/hypr/hyprrepair.sh
   ```
3. Log out and select Hyprland from your display manager, or run:
   ```sh
   Hyprland
   ```
4. Adjust configuration files as needed for your preferences.
