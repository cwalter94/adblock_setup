#!/usr/bin/env bash -x

# get vars from cmd line:
# s=server, u=ssh_user, c=client, k=ssh_key
while getopts ":s:u:k:v:d:" opt; do
  case $opt in
    s) SERVER="$OPTARG"
    ;;
    u) SERVER_LOGIN_USER="$OPTARG"
    ;;
    k) SSH_KEY="$OPTARG"
    ;;
    v) VPN_SERVER="$OPTARG"
    ;;
    d) DNS_SERVER="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

if [ -z $SERVER ]; then
    echo 'Must provide public server IP address.'
    exit 1
fi

if [ -z ${SSH_KEY} ]; then
    echo 'Must provide path to keyfile for SSH access to server.'
    exit 1
fi

if [ -z $SERVER_LOGIN_USER ]; then
    SERVER_LOGIN_USER='root'
    echo "No ssh user set. Defaulting to '$SERVER_LOGIN_USER'."
fi

if [ -z $VPN_SERVER ]; then
    echo 'Must provide vpn server IP address that will be using this PiHole server.'
    exit 1
fi

