#!/bin/bash

wallpapers="/usr/share/backgrounds"
img=$(ls "$wallpapers" | shuf | head -n1)

nitrogen --set-auto "$wallpapers/$img"
