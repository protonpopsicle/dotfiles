#!/bin/bash

clock() {
    echo "%{F#FF0}%{B#00F}"
    date '+%-l:%M %p'
}

battery() {
    local dir=/sys/class/power_supply/BAT0
    capacity=`cat $dir/capacity`
    satus=`cat $dir/status`

    test "$status" = "Full" && echo -n '+' || echo -n '-'
    echo $capacity%
}

network() {
    ping -c 1 8.8.8.8 >/dev/null 2>&1 && 
        echo "up" || echo "down"
}

backlight() {
    local dir=/sys/class/backlight/acpi_video0
    brightness=`cat $dir/brightness`
    max_brightness=`cat $dir/max_brightness`
    echo "%{B#000}%{F#0F0}"
    printf "%0.s-" $(seq 1 $brightness)
    echo "%{F#070}"
    printf "%0.s-" $(seq 1 $max_brightness - $brightness)
}

while :; do
    end="%{F-}%{B-}"
    echo "${l} `brightness` ${r} `clock` `battery` `network` $end"
    sleep 1
done
