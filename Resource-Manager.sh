#!/bin/bash

EMAIL="Varunkausal2004@gmail.com"   
SUBJECT="🖥️ Linux Resource Report - $(hostname)"
BODY=$(mktemp)           

{
  echo "Linux Resource Monitor - $(date)"
  echo "--------------------------------------"
  uptime
  echo
  echo "CPU Usage:"
  top -bn1 | grep "Cpu(s)"
  echo
  echo "Memory Usage:"
  free -h
  echo
  echo "Disk Usage:"
  df -h | grep "^/dev"
  echo
  echo "Network I/O:"
  ip -s link
  echo
  echo "Top 5 Processes:"
  ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6
} > "$BODY"


mail -s "$SUBJECT" "$EMAIL" < "$BODY"


rm "$BODY"
