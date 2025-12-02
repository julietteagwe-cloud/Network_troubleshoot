#!/bin/bash

#----------------------------------------------------

# Troubleshooting Script for Ubuntu and CentOs

# Author: Juliette Joseph-Odogbo

# Purpose


#--- This script checks  the most common network problems

# -- Missing or wrong Ip address

#----Wrong or missing default gateway (very common with virtualBox NAT

#----DNS issues

#----Basic connectivity tests

# Output

#   A report file will be created at:

#      ./network_troubleshoot_report.txt

# How to Run the Script

#  1. Make it executable: chmod +x network_troubleshoot.sh

#  2. Run it: sudo ./network_troubleshoot.sh

# System Requirements:

#---No system updates or special packages are required for this script to run sucessfully

#--- Works on both Ubuntu and CentOs

REPORT="/home/juliette/network_troubleshoot_report.txt"

echo "============= NETWORK TROUBLESHOOTING REPORT ===========" >> "$REPORT"

echo "Generated on: $(date)" >> "$REPORT"

echo " " >> "$REPORT"

echo "===============CHECKING IP ADDRESS ===============" | tee -a "$REPORT"

ip addr show | tee -a "$REPORT"

echo " " | tee -a  "$REPORT"

echo "==================CHECKING DEFAULT GATEWAY  =========" | tee -a "$REPORT"

ip route | tee -a "$REPORT"


echo " " | tee -a "$REPORT"

echo "===================CHECKING DNS SETTINGS  ==============" |  tee  -a "$REPORT"

cat  /etc/resolv.conf | tee -a "$REPORT"

echo " " | tee -a "$REPORT"


echo "==================== TESTING INTERNET CONNECTIVITY (PING)  =======" | tee -a "$REPORT"

ping -c 2 google.com 2>&1 | tee -a "$REPORT"

echo " " | tee -a "$REPORT"

echo "============= REPORT COMPLETE =====" | tee -a "$REPORT"

echo "Report saved to: $REPORT"
