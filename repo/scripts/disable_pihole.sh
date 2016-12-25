#!/bin/sh
sudo bash
cp disablehole.conf /etc/dnsmasq.conf

sudo service hostapd stop
sudo service dnsmasq stop

sudo service hostapd start
sudo service dnsmasq start


