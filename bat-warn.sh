#!/bin/sh

warn=10
min=5
warned=0
while true
do
	input='/sys/class/power_supply/BAT0/status'
	read -r state < "$input"
	if [ "$state" = Discharging ]
	then
		input='/sys/class/power_supply/BAT0/capacity'
		read -r bat < "$input"
		if [ "$bat" -le "$warn" ] && [ "$warned" -ne 1 ]
		then
			notify-send 'Battery Low'
			warned=1
			if [ "$bat" -le "$min" ]
			then
				ZZZ
			fi
		fi
	else
		warned=0
	fi
	sleep 10
done
