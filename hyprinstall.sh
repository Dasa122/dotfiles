#!/bin/bash
cd ~
sudo pacman -Syu
sleep 2
sudo pacman -Rndd $(pacman -Q | grep -E '(hypr|aqua|Hypr)'| awk '{print $1}') hyprlang aquamarine hyprcursor hyprgraphics hyprland-qt-support hyprland-qtutils hyprutils hyprwayland-scanner hyprpolkitagent hyprland hyprlock hypridle --noconfirm
sleep 2
sudo pacman  -S qt6 waybar hyprland-protocols gtk4-layer-shell  --noconfirm
sleep 2
paru -S ninja gcc cmake meson libxcb xcb-proto xcb-util xcb-util-keysyms libxfixes libx11 libxcomposite libxrender libxcursor pixman wayland-protocols cairo pango libxkbcommon xcb-util-wm xorg-xwayland libinput libliftoff libdisplay-info cpio tomlplusplus xcb-util-errors re2

sudo rm -rf /home/$USER/Hyprland
mkdir Hyprland
cd Hyprland

git clone https://github.com/hyprwm/hyprlang.git --recursive
git clone https://github.com/hyprwm/aquamarine.git --recursive
git clone https://github.com/hyprwm/hyprcursor.git --recursive
git clone https://github.com/hyprwm/hyprgraphics.git --recursive
git clone https://github.com/hyprwm/hyprland-qt-support.git --recursive
git clone https://github.com/hyprwm/hyprland-qtutils.git --recursive
git clone https://github.com/hyprwm/hyprutils.git --recursive
git clone https://github.com/hyprwm/hyprwayland-scanner.git --recursive
git clone https://github.com/hyprwm/hyprpolkitagent.git --recursive
git clone https://github.com/hyprwm/hyprland.git --recursive
git clone https://github.com/hyprwm/hyprlock.git --recursive
git clone https://github.com/hyprwm/hypridle.git --recursive
git clone https://github.com/ErikReider/SwayOSD.git --recursive

sleep 2

cd hyprlang
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target hyprlang -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
sudo cmake --install ./build

sleep 2

cd ../aquamarine
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
sudo cmake --install ./build

sleep 2

cd ../hyprcursor
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
sudo cmake --install build

sleep 2

cd ../hyprgraphics
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
sudo cmake --install ./build

sleep 2

cd ../hyprland-qt-support
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -DINSTALL_QML_PREFIX=/lib/qt6/qml -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
sudo cmake --install ./build

sleep 2

cd ../hyprland-qtutils
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
sudo cmake --install ./build

sleep 2

cd ../hyprutils
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
sudo cmake --install ./build

sleep 2

cd ../hyprwayland-scanner
cmake -DCMAKE_INSTALL_PREFIX=/usr -B build
cmake --build build -j `nproc`
sudo cmake --install build

sleep 2

cd ../hyprpolkitagent
cmake -DCMAKE_INSTALL_PREFIX=/usr -B build
cmake --build build -j `nproc`
sudo cmake --install build

sleep 2

cd ../hyprland
make all && sudo make install

sleep 2

cd ../hyprlock
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -S . -B ./build
cmake --build ./build --config Release --target hyprlock -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
sudo cmake --install build

sleep 2

cd ../hypridle
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
sudo cmake --install ./build

sleep 2

cd ../SwayOSD
meson setup build --prefix=/usr
ninja -C build
sudo ninja -C build install

sleep 2

