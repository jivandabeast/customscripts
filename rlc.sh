#!/bin/bash

pids=$(pidof -x "rlc.sh")
current_pid=$( printf '%03d' $$ )

if [[ $pids == $current_pid ]]
then
	cd /home/jivan/Documents/Projects/lemmyRedditClone
	source .venv/bin/activate
	python3 main.py
	deactivate
else 
    echo "Another instance of this script is currently running, exiting!"
fi
