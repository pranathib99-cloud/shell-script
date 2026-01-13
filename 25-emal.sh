#!/bin/bash

DISK_THRESHOLD=2 # in projects we keep it as 75
EMAIL="b.pranathi41@gmail.com"
HOSTNAME=$(hostname)
MESSAGE=""

while IFS= read -r line
do
  USAGE=$(echo "$line" | awk '{print $6}' | cut -d "%" -f1)
  PARTITION=$(echo "$line" | awk '{print $7}')

  if [ "$USAGE" -ge "$DISK_THRESHOLD" ]; then
     MESSAGE+="High Disk Usage on $PARTITION : $USAGE%\n"
  fi
done <<< "$(df -hT | grep -v Filesystem)"

if [ -n "$MESSAGE" ]; then
  echo -e "Alert from $HOSTNAME\n\n$MESSAGE" | s-nail -s "Disk Usage Alert" "$EMAIL"
fi

