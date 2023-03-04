#!/bin/bash

# Get the current state of the external monitor
output=$(xrandr --query | grep "HDMI-1 connected" | cut -d ' ' -f2)

if [ "$output" = "connected" ]; then
  # If the external monitor is disconnected, switch to external monitor only
  xrandr --output eDP-1 --off --output HDMI-1 --auto --primary
  pactl set-card-profile alsa_card.pci-0000_00_1f.3 output:hdmi-stereo
else
  # If the external monitor is connected, switch to laptop screen only
  xrandr --output HDMI-1 --off --output eDP-1 --auto --primary
  pactl set-card-profile alsa_card.pci-0000_00_1f.3 output:analog-stereo
fi
feh --randomize --preload --bg-fill ~/Pictures/Wallpapers/
