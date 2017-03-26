#!/usr/bin/env bash -x;

sudo ufw allow proto tcp from 10.8.0.0/24 to ${DNS_IP} port 80
sudo ufw allow proto tcp from 10.8.0.0/24 to ${DNS_IP} port 53
sudo ufw allow proto udp from 10.8.0.0/24 to ${DNS_IP} port 53
