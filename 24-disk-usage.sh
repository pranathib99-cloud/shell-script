#!/bin/bash


DISK_USAGE=$(df -ht | grep -v Filesystem)
DISK_USAGE=$(df -hT | grep -v Filesystem)

DISK_THRESHOLD=2 #in projects we keep it as 75
MESSAGE=""
IP_ADDRESS=$( curl -s http://169.254.169.254/latest/meta_data/local_ipv4)
while IFS= read -r line

USAGE=$(echo $line |awk '{ print $6 }' | cut -d "%" -f1)
PARTITION=$( echo $line |awk '{ print $7}')
if [ $USAGE -ge $DISK_THRESHOLD ] : then
MESSAGE+= " high disk usage $PARTITION=$USAGE % <br> "

  USAGE=$(echo $line |awk '{ print $6 }' | cut -d "%" -f1)
  PARTITION=$( echo $line |awk '{ print $7}')
  if [ $USAGE -ge $DISK_THRESHOLD ] : then
     MESSAGE+= " high disk usage $PARTITION=$USAGE % <br> "
  fi

done <<<  $DISK_USAGE