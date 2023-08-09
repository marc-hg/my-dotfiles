#!/bin/bash

# Get the current state of the external monitor
output=$(xrandr --query | grep "DP-1 connected (" | cut -d ' ' -f2)

if [ "$output" = "connected" ]; then
  # If the external monitor is disconnected, switch to external monitor only
  xrandr --output eDP-1 --off --output DP-1 --mode 2560x1080 --rate 74.99 --auto --primary
  # pactl set-card-profile alsa_card.pci-0000_00_1f.3 output:hdmi-stereo
  feh -feh --randomize --bg-fill ~/my-dotfiles/backgrounds/default.jpg
else
  # If the external monitor is connected, switch to laptop screen only
  xrandr --output DP-1 --off --output eDP-1 --auto --primary
  feh -feh --randomize --bg-fill ~/my-dotfiles/backgrounds/default.jpg
  # pactl set-card-profile alsa_card.pci-0000_00_1f.3 output:analog-stereo+input:analog-stereo
fi
feh --randomize --preload --bg-fill ~/Pictures/Wallpapers/
