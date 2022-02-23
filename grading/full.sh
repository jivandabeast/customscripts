#!/bin/bash

affirmations=("Great Job!" "Awesome :)" "Perfect!" "Amazing!" "Keep up the good work!" "Well done!")

xdotool mousemove --screen 0 1799 616
xdotool click 1
xdotool type 3
xdotool mousemove --screen 0 1724 825
sleep 1
xdotool click 1
rand=$((0 + $RANDOM % 5))
feedback=${affirmations[$rand]}
echo $feedback
xdotool type "$feedback"
xdotool click 5
sleep 1
xdotool mousemove --screen 0 1843 972
xdotool click 1
xdotool mousemove --screen 0 1875 263
sleep 3
xdotool click 1
