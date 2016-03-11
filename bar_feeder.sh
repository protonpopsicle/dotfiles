#!/bin/bash

clock() {
    date '+%-l:%M %p'
}

battery() {
    local dir=/sys/class/power_supply/BAT0
    capacity=`cat $dir/capacity`
    satus=`cat $dir/status`

    #test "$status" = "Full" && echo -n '+' || echo -n '-'
    echo $capacity%
}

network() {
    ping -c 1 8.8.8.8 >/dev/null 2>&1 && 
        echo "up" || echo "down"
}

meter() {
    local v=$1
    local max=$2
    local color1=$3
    local color2=$4
    local diff=`expr $max - $v`
    local fill1=""
    local fill2=""

    if [ $v != 0 ]; then
        fill1=`printf "%0.s " $(seq 1 $v)`
    fi
    if [ $diff != 0 ]; then
	fill2=`printf "%0.s " $(seq 1 $diff)`
    fi
    echo "$color1$fill1$color2$fill2"    
}

backlight() {
    local dir=/sys/class/backlight/acpi_video0
    brightness=`cat $dir/brightness`
    max_brightness=`cat $dir/max_brightness`
    meter $brightness $max_brightness "%{B#00F}" "%{B#007}"
}

while :; do
    end="%{F-}%{B-}"
    c1="%{F#FF0}%{B#00F}"
    c2="%{F#FFF}%{B#777}"
    c3="%{F#F00}%{B#000}"
    echo "%{l}`backlight`%{r}$c1 `clock` $c2 `battery` $c3 `network`$end"
    sleep 1
done
