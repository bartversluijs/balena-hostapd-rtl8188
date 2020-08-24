#!/bin/bash

# Do some cleaning up
pkill -9 dnsmasq
ifdown ap0
ifup ap0

sed -i -E "s/%%BALENA_DEVICE_UUID%%/${BALENA_DEVICE_UUID:0:7}/g" /etc/hostapd/hostapd.conf

# Start the access point
hostapd_RTL8188 /etc/hostapd/hostapd.conf &
dnsmasq --keep-in-foreground
