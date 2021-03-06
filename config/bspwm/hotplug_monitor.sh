#!/bin/sh

function setupSingleMonitor() {
    # Setup single monitor
    xrandr --output LVDS1 --primary --mode 1366x768 --output DP1 --off

    # Setup bscp virtual displays
    bspc monitor DP1 -r
    bspc monitor LVDS1 -d 1 2 3 4 5 6
}

function setupDualMonitors() {
    # Setup dual monitor
    xrandr --output LVDS1 --primary --mode 1366x768 --output DP1 --mode 1920x1080 --above LVDS1

    # Make sure monitors are in the right order
    if ! bspc query --monitors --names | head -1 | grep LVDS1; then
        bspc monitor LVDS1 --swap DP1
    fi

    # Setup bscp virtual displays
    bspc monitor LVDS1 -d 1 2 3 4 5 6
    bspc monitor DP1 -d 7 8 9
}

if xrandr -q | grep -w connected | grep DP1; then
    setupDualMonitors
else
    setupSingleMonitor
fi

feh --bg-fill $HOME/Images/backgrounds/default.jpg
$HOME/.config/polybar/launch.sh
