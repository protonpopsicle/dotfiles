#/!bin/bash

declare -i brightness=`cat /sys/class/backlight/acpi_video0/brightness`

if [ "$1" == + ]; then
    declare -i test=$brightness+1
    `echo $test > /sys/class/backlight/acpi_video0/brightness`

elif [ "$1" == "-" ]; then
    declare -i test=$brightness-1
    `echo $test > /sys/class/backlight/acpi_video0/brightness`
else
    exit 0;
fi
