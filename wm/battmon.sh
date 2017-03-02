#!/bin/bash

usage () {
cat <<HELP
Send OSD notifications on low battery levels

usage: $(basename "$0") [-w num] [-c num]
   -w : warn percent (Default: 25)
   -c : critical percent (Default: 5)

https://github.com/keithieopia/bin/

Copyright (c) 2016 - 2017 Timothy Keith
Licensed under the MIT license.
HELP
}

WARN=25
CRITICAL=5

while [ "$1" != "" ]; do
case $1 in
    -w) shift
        WARN=$1
        ;;
    -c) shift
        CRITICAL=$1
        ;;
    -h) usage
        exit
        ;;
    *)  usage
        exit 1
        ;;
    esac
    shift
done

time_left() {
    ACPI=$(acpi -b | awk '{print $5}' | tr ':' ' ')
    H=$(awk '{print $1}' <<< "$ACPI" | sed 's/^0*//')
    M=$(awk '{print $2}' <<< "$ACPI" | sed 's/^0*//')

    if [ -z "$H" ]; then
        H=0
    else
        if [ "$H" -gt "1" ]; then
            HOURS="$H hours"
        else
            HOURS="1 hour"
        fi
    fi

    if [ -z "$M" ]; then
        M=0
    else
        if [ "$M" -gt "1" ]; then
            MINUTES="$M minutes"
        else
            MINUTES="1 minute"
        fi
    fi

    # output
    if [ "$H" -gt "0" ]; then
        if [ "$M" -gt "0" ]; then
            echo "$HOURS and $MINUTES"
        else
            echo "$HOURS"
        fi
    else
        echo "$MINUTES"
    fi
}

while true; do
    source /sys/class/power_supply/BAT1/uevent

    if [ "$POWER_SUPPLY_STATUS" == "Discharging" ]; then
        if [ $POWER_SUPPLY_CAPACITY -le $CRITICAL ]; then
            paplay "$HOME/bin/assets/sounds/warning.ogg"
            say.sh "The battery is critically low. Only $(time_left) remains"
            paplay "$HOME/bin/assets/sounds/warning.ogg"
        elif [ $POWER_SUPPLY_CAPACITY -le $WARN ]; then
            paplay "$HOME/bin/assets/sounds/info.ogg"
            say.sh "The battery is low. There is enough charge to last $(time_left)"
        fi
    fi

    sleep 300
done
