#!/usr/bin/env bash

killall -9 waybar
pkill swaync

waybar &
swaync &
