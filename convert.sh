#!/bin/bash
# Set the bitrate for the opus files (in kbps)
BITRATE=160
source=$1
dest=$2

# Loop through all files in the current directory
for file in $(find $1 - type f -name \*.flac  -print0 | while IFS= read -r -d '' file); 
do
  # Check if the file is a flac file
  ffmpeg -i "$file" -b:a "${BITRATE}k" "$dest${file#source%.flac}.opus"
done

