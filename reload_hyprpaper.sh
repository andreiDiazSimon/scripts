#!/bin/bash

# Kill the current hyprpaper process
pkill hyprpaper

# Wait a moment to ensure it's fully terminated
sleep 1

# Restart hyprpaper with your preferred configuration
hyprpaper &
