#!/bin/bash

source /home/jivan/Downloads/Software/pywal/.venv/bin/activate
rm /home/jivan/.cache/wal/schemes/*
wal -i /home/jivan/Pictures/wallpaper.jpg
deactivate

