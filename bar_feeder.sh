#!/bin/bash

clock() {
    date '+%-l:%M %p'
}

battery() {
    local capacity=`cat /sys/class/power_supply/BAT0/capacity`
    local satus=`cat /sys/class/power_supply/BAT0/status`

    test "$status" = "Full" && echo -n '+' || echo -n '-'
    echo $capacity%
}

network() {
    ping -c 1 8.8.8.8 >/dev/null 2>&1 && 
        echo "up" || echo "down"
}

brightness() {
    b=`cat /sys/class/backlight/acpi_video0/brightness`
    max_b=`cat /sys/class/backlight/acpi_video0/max_brightness`
    printf "%0.s-" $(seq 1 $b)
}

while :; do
    c1="%{c}%{F#FFFF00}%{B#0000FF}"
    end="%{F-}%{B-}"
    echo "$c1 `brightness` `clock` `battery` `network` $end"
    sleep 1
done
