#!/bin/bash

timestamp=$(date +%Y_%m_%d_%S)
output_file="/home/lommix/Documents/Screenrecs/${timestamp}.mp4"

if [ -n "$1" ]; then
	output_file="$1"
fi

wf-recorder -f ${output_file}
