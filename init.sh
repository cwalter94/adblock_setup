#!/usr/bin/env bash -x

## configure env vars
source ./config.sh;

## install pi-hole
ssh -i ${SSH_KEY} -l ${SERVER_LOGIN_USER} ${SERVER} "sudo bash -v -s " -- < ./pihole-basic-install.sh;

## pi-hole pw: CiV5gseP

## on vpn machine
# sudo vi /etc/openvpn/server.conf
sudo ufw allow proto tcp from ${VPN_SERVER} to ${DNS_SERVER} port 80
sudo ufw allow proto tcp from ${VPN_SERVER} to ${DNS_SERVER} port 53
sudo ufw allow proto udp from ${VPN_SERVER} to ${DNS_SERVER} port 53



