#!/bin/bash

#variable
#ram
MEMORY=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", ($3+$6)*100/$2 }')
memUsage=$(free -m | awk '/Mem/{print $3+$6}')
#disk
DISK=$(df -h | awk '$NF=="/"{printf "%s\t\t", $5}')
diskUsage=$(df -h | awk '$NF=="/"{printf "%s\t\t", $3}')
#cpu
CPU=$(top -bn1 | grep load | awk '{printf "%.2f%%\t\t\n", $(NF-2)}')
#current-date
DATE=$(date "+%Y-%m-%d %H:%M:")
#Result
Resultdata="$DATE CPU Usage(%): $CPU RAM Usage(%): $MEMORY Used $memUsage MB  DISK Usage(%): $DISK Used $diskUsage"
#keep-file
echo $Resultdata >> /prod-monitor.log
