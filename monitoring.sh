#!/bin/bash
wall "
#Architecture: $(uname -a)
#CPU physical: $(nproc --all)
#vCPU: $(grep "processor" /proc/cpuinfo |wc -l)
#Memor Usage: $(free -m | grep "Mem" | awk '{printf("%d/%dMB (%.2f%%)", $3, $2, $3*100/$2)}')
#Disk Usage: $(df -m | grep "/dev/mapper/ccaswell42--vg-root" | awk '{printf("%s/%dGb (%s)", $4, $2/1024, $5)}')
#CPU Load: $(top -bn1 | grep "%Cpu" | awk '{printf("%.1f%%", $2+$4)}')
#Last Boot: $(who -b | awk '{print $3 " " $4}')
#LVM use: $(lsblk | grep "lvm" | awk '{if ($1) {print "yes"; exit;} else {print "no"}}')
#Connetion TCP: $( netstat | grep "tcp" | wc -l) ESTABLISHED
#User log: $(users | wc -l)
#Network: IP $(hostname -i) ($(ip a | grep "ether" | awk '{print $2}'))
#Sudo: $(grep "COMMAND" /var/log/sudo/sudo.log | wc -l) cmd"