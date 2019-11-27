#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bars
polybar topbar &

if bspc query -M --names | grep DP1; then
    polybar monitor &
fi

echo "Bars launched..."
