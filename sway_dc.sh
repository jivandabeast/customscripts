#!/bin/bash
# Written by Jivan RamjiSingh

# Thanks Kiran for this line
display_name=$(swaymsg -t get_outputs | jq .[].name | grep HEADLESS | tr -d '')

swaymsg output $display_name unplug
