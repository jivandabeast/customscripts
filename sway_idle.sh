#!/bin/bash

swayidle -w \
         timeout 10 'swaylock -f -c 000000' \
         timeout 20 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' \
         before-sleep 'swaylock -f -c 000000'