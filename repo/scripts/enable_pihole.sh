#!/bin/sh
sudo bash
cp enablehole.conf /etc/dnsmasq.conf
sh ap_restart.sh


sudo service hostapd stop
sudo service dnsmasq stop

sudo service hostapd start
sudo service dnsmasq start


