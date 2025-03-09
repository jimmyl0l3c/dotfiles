#!/bin/sh

pactl get-source-volume \
    alsa_input.usb-BurrBrown_from_Texas_Instruments_USB_AUDIO_CODEC-00.analog-stereo \
    | awk -F '[^0-9]+' '/front-left:/{print $3}'
