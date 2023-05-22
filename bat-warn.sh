#!/bin/sh

warn=10
min=5
warned=0
stat='/sys/class/power_supply/BAT0/status'
cap='/sys/class/power_supply/BAT0/capacity'
while true
do
	read -r state < "$stat"
	if [ "$state" = Discharging ]
	then
		read -r bat < "$cap"
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
