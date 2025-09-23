sudo pacman -Rns $(pacman -Q | grep -E '(hypr|aqua)'| awk '{print $1}') --noconfirm
cd ~/Hyprland
git pull
paru -S ninja gcc cmake meson libxcb xcb-proto xcb-util xcb-util-keysyms libxfixes libx11 libxcomposite libxrender libxcursor pixman wayland-protocols cairo pango libxkbcommon xcb-util-wm xorg-xwayland libinput libliftoff libdisplay-info cpio tomlplusplus hyprlang-git hyprcursor-git hyprwayland-scanner-git xcb-util-errors hyprutils-git glaze hyprgraphics-git aquamarine-git re2 hyprland-qtutils hyprlock hypridle
make all && sudo make install
