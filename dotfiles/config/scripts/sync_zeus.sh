#!/bin/bash

src="/home/ananthu/Downloads/torrents/sync_zeus/"
dst="/home/ubuntu/temp/qbittorrent/downloads/sync"

while true; 
do
    rsync -e 'ssh -i /home/ananthu/Zeus.pem' -a $src ubuntu@ec2-43-204-220-8.ap-south-1.compute.amazonaws.com:$dst --delete
    sleep 5s
 done