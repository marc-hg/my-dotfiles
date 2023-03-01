#!/bin/bash

# Get the current state of the HDMI output
output_status=$(xrandr | grep "HDMI-1" | awk '{print $2}')

# If the HDMI output is disconnected, turn it on and disable the laptop display
if [ "$output_status" == "disconnected" ]; then
    xrandr --output HDMI-1 --auto --output eDP-1 --off
# If the HDMI output is connected, turn it off and enable the laptop display
else
    xrandr --output HDMI-1 --off --output eDP-1 --auto
fi
