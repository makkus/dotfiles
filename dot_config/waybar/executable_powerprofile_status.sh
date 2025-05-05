#!/bin/sh

# Output the current power profile for Waybar

profile=$(powerprofilesctl get 2>/dev/null)
if [ -n "$profile" ]; then
  # Optionally, use icons for each profile
  case "$profile" in
    performance)
      icon="" # Font Awesome bolt
      ;;
    balanced)
      icon="" # Font Awesome balance-scale
      ;;
    power-saver)
      icon="" # Font Awesome leaf
      ;;
    *)
      icon="?" ;;
  esac
  # echo "$icon $profile"
  echo "$icon"
else
  echo "No profile"
fi