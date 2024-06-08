#!/bin/bash

if [ -z "$1" ]; then
	echo "no video"
	exit 0
fi

input=$1
name="prep_$(basename "$input")"

ffmpeg -i $1 -c:v libx264 -profile:v main -level 4.0 -preset medium -vf "scale=-1:720,format=yuv420p" -c:a aac -ac 2 -ar 44100 -b:a 128k -movflags +faststart -r 30 -g 60 -maxrate 5M -bufsize 10M -b:v 1M -shortest -f mp4 $name
