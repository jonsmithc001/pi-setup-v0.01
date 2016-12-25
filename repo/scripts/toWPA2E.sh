#!/bin/sh
sudo bash
cp hostapd_wpa2e /etc/hostapd/hostapd.conf


sudo service hostapd stop
sudo service dnsmasq stop

sudo service hostapd start
sudo service dnsmasq start


