#!/bin/bash
cd /root/monitor-linux
chmod -R 777 prod-monitor.sh
apt install cron -y

crontab -l > mycron
echo "*/15 * * * * /root/monitor-linux/prod-monitor.sh" >> mycron
crontab mycron

systemctl restart cron && systemctl status cron

grep CRON /var/log/syslog

cd /root/monitor-linux
./prod-monitor.sh
tail /prod-monitor.log

