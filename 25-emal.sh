#!/bin/bash

DISK_THRESHOLD=75
EMAIL="admin@example.com"
HOSTNAME=$(hostname)
MESSAGE=""

df -hT | grep -v Filesystem | while read -r line
do
  USAGE=$(echo "$line" | awk '{print $6}' | cut -d "%" -f1)
  PARTITION=$(echo "$line" | awk '{print $7}')

  if [ "$USAGE" -ge "$DISK_THRESHOLD" ]; then
     MESSAGE+="High Disk Usage on $PARTITION : $USAGE%\n"
  fi
done

if [ -n "$MESSAGE" ]; then
  echo -e "Alert from $HOSTNAME\n\n$MESSAGE" | s-nail "Disk Usage Alert" "$EMAIL"
  echo "Disk alert" | mail -s "Disk Alert" alert@company.com

fi
