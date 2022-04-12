#!/bin/bash

firstHalf=$(date '+%Y-%m-%d %H:%M:%S')
secondHalf=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 13)
fileName="$firstHalf-$secondHalf.png"
fileLocation="/home/jivan/Pictures/sstemp/$fileName"

import -format png "${fileLocation}"
xclip -sel c -t image/png < "${fileLocation}"
