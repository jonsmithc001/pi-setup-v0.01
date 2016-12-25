#!/bin/sh
sudo bash

sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
sudo iptables -A FORWARD -i eth0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT
iptables -t nat -A PREROUTING -p tcp -m tcp --dport 9091 -j DNAT --to-destination 192.160.1.18
iptables -t nat -A POSTROUTING -d 192.160.1.18 -p tcp -m tcp --dport 9091 -j MASQUERADE


sudo service hostapd stop
sudo service dnsmasq stop

sudo service hostapd start
sudo service dnsmasq start

wget  -O /dev/null  http://freedns.afraid.org/dynamic/update.php?UnVFQ0RoQ29VNG9hVmRKZnp1NER6a0o1OjE2NTE5NjE3
while [ $? -ne 0 ]; do
    sleep 5
    wget -O /dev/null  http://freedns.afraid.org/dynamic/update.php?UnVFQ0RoQ29VNG9hVmRKZnp1NER6a0o1OjE2NTE5NjE3
done
