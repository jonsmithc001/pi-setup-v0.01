#!/bin/sh
sudo bash
sudo service tor stop
sudo iptables -F
sudo iptables -t nat -F

sudo service tor start

sudo iptables -t nat -A PREROUTING -i wlan0 -p tcp --dport 22 -j REDIRECT --to-ports 22
sudo iptables -t nat -A PREROUTING -i wlan0 -p udp --dport 53 -j REDIRECT --to-ports 53
sudo iptables -t nat -A PREROUTING -i wlan0 -p tcp --syn -j REDIRECT --to-ports 9040

sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
sudo iptables -A FORWARD -i eth0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i wlan0 -o eth0 -j ACCEPT
iptables -t nat -A PREROUTING -p tcp -m tcp --dport 9091 -j DNAT --to-destination 192.160.1.18
iptables -t nat -A POSTROUTING -d 192.160.1.18 -p tcp -m tcp --dport 9091 -j MASQUERADE
