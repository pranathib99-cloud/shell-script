#!/bin/bash

DISK_THRESHOLD=2
CPU_THRESHOLD=2
RAM_THRESHOLD=2

echo "===== Disk Usage Check ====="
df -h | grep -v Filesystem | while read line
do
  USAGE=$(echo "$line" | awk '{print $5}' | cut -d% -f1)
  PARTITION=$(echo "$line" | awk '{print $6}')

  if [ "$USAGE" -ge "$DISK_THRESHOLD" ]; then
    echo "Warning: Disk usage on $PARTITION is ${USAGE}%"
  fi
done

echo
echo "===== CPU Usage Check ====="
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')

CPU_USAGE=${CPU_USAGE%.*}

if [ "$CPU_USAGE" -ge "$CPU_THRESHOLD" ]; then
  echo "Warning: CPU usage is ${CPU_USAGE}%"
fi

echo
echo "===== Memory Usage Check ====="
MEM_USAGE=$(free | awk '/Mem/ {print ($3/$2)*100}')

MEM_USAGE=${MEM_USAGE%.*}

if [ "$MEM_USAGE" -ge "$RAM_THRESHOLD" ]; then
  echo "Warning: Memory usage is ${MEM_USAGE}%"
fi
