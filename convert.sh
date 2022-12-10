#!/bin/bash
# Set the bitrate for the opus files (in kbps)
BITRATE=160
source=$1
dest=$2

# Loop through all files in the current directory
find $1 -type f -name \*.flac  -print0 | while IFS= read -r -d '' file; 
do
  # Check if the file is a flac file
  filedest=${dest/$source/$dest}
  echo $filedest
  ffmpeg -i "$file" -b:a "${BITRATE}k" "${filedest%.flac}.opus"
done

