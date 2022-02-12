#!/bin/sh

MIN=5
while true
do
    state=$(acpi | cut -d, -f 1 | cut -c 12-14)
    if [ $state = "Dis" ]
    then
        bat=$(acpi | cut -d, -f 2 | sed 's/[%,]//g')
        if [ "$bat" -le "$MIN" ]
        then
            ZZZ
        fi
    fi
done
