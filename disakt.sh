#!/bin/bash

pids=$(pidof -x "disakt.sh")
current_pid=$( printf '%03d' $$ )

if [[ $pids == $current_pid ]]
then
    cd /home/jivan/Documents/Projects/traktdiscordpersonal/
    source .venv/bin/activate
    python3 disakt.py
    deactivate
else 
    echo "Another instance of this script is currently running, exiting!"
fi

