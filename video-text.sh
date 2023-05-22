#!/bin/sh

if [ "$4" = t ]
then
	h='0'
elif [ "$4" = b ]
then
	h='(h-text_h)'
else
	h='(h-text_h)/2'
fi
text=$(printf %b "$2")
ffmpeg -i "$1"\
	-vf "drawtext=fontfile=/usr/share/fonts/noto/NotoSansMono-Regular.ttf\
	:text=${text}:fontcolor=white:fontsize=24:box=1:boxcolor=black@0.5\
	:boxborderw=5:x=(w-text_w)/2:y=${h}"\
	 -codec:a copy "${3:-output.mp4}"
