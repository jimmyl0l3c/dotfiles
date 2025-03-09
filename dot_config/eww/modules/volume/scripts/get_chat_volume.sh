#!/bin/sh

pactl get-sink-volume \
    alsa_output.usb-SteelSeries_SteelSeries_Arctis_7-00.mono-chat \
    | awk -F '[^0-9]+' '/mono:/{print $3}'
