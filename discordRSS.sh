#!/bin/bash

cd /home/jivan/Documents/Projects/discordRSS
source .venv/bin/activate
python3 discordRSS.py >> output.log
deactivate
