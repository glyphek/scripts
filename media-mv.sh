#!/bin/sh

files=$(find "$1" -type f -regex\
	'.*\(jpg\|jpeg\|png\|gif\|mp4\|avi\|svg\|mp3\|vob\)')

for file in ${files}
do
	date=$(exiftool -s -s -s -FileModifyDate "$file")
	year=$(echo "$date" | cut -d ':' -f 1)
	month=$(echo "$date" | cut -d ':' -f 2)
	mkdir -p "${2:-$1}/${year}/${month}"
	mv "$file" "${2:-$1}/${year}/${month}"
done
