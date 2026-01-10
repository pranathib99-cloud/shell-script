#1/bin/bash
echo " disk utilization"

R="\e[31m"  #Red
N="\e[0m"

THRESHOLD=10

df -h | awk 'NR>1 {print $5 " " $6}' | while read usage mount   


do
  percent=${usage%\%}

  if [ "$percent" -ge "$THRESHOLD" ]; then
    echo "$R WARNING: Disk usage on $mount is ${percent}% $N"  
    fi
done 



