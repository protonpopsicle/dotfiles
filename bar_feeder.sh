#!/bin/bash

clock() {
    date '+%a %b %-e  %-l:%M %p'
}

battery() {
    local dir=/sys/class/power_supply/BAT0
    local capacity=`cat $dir/capacity`
    local status=`cat $dir/status`    

    local val=$(printf "%02s" $capacity)
    #local val=$(printf "%2.f" `echo $capacity/20 | bc -l`)
    #echo "`meter $val 5`"
    #test "$status" = "Charging" && echo -n '+' || echo -n ' '
    if [ "$status" = "Charging" ]
    then
 	echo "[$val%  ]+"
    else
	echo "[$val%  ] "
    fi
}

network() {
    ping -c 1 8.8.8.8 >/dev/null 2>&1 && 
        echo " " || echo "!"
}

meter() {
    local v=$1
    local max=$2
    local diff=`expr $max - $v`
    local fill1
    local fill2

    if [ $v != 0 ]; then
        fill1=`printf "%0.s#" $(seq 1 $v)`
    fi
    if [ $diff != 0 ]; then
	fill2=`printf "%0.s " $(seq 1 $diff)`
    fi
    echo "[%{F#0F0}$fill1%{F-}$fill2]"
}

backlight() {
    local dir=/sys/class/backlight/acpi_video0
    brightness=`cat $dir/brightness`
    max_brightness=`cat $dir/max_brightness`
    meter $brightness $max_brightness
}

while :; do
    st="%{A:st -f 'Mono-12' &:} st %{A}"
    apps="$st"
    echo "%{l}%{F#F0F}$apps%{F-}%{r}`battery`  `clock` "
    sleep 1
done
