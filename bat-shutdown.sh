#!/bin/sh

min=5
while true
do
    state=$(acpi | cut -d, -f 1 | cut -c 12-14)
    if [ $state = "Dis" ]
    then
        bat=$(acpi | cut -d, -f 2 | cut -c 1-3 | sed 's/[%,]//g')
        if [ "$bat" -le "$min" ]
        then
            echo $bat
            ZZZ
        fi
    fi
    sleep 10
done
