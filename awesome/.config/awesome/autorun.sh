#!/bin/sh

run() {
    if ! pgrep -f "$1"; then
        "$@" &
    fi
}

run "lxqt-policykit-agent"
run "nm-applet"
run "dunst"
run "feh" --bg-fill $HOME/Downloads/walls/wall/wallpapers/b-219.jpg
run "xfce4-power-manager"
