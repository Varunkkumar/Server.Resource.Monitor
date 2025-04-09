#!/bin/bash

while true
do
    clear
    echo "----------------------------------------"
    echo "🖥️  Linux Resource Monitor"
    echo "Updated at: $(date)"
    echo "----------------------------------------"

    uptime
    echo ""
    echo "🔥 CPU Usage:"
    top -bn1 | grep "Cpu(s)"

    echo ""
    echo "🧠 Memory Usage:"
    free -h

    echo ""
    echo "💾 Disk Usage:"
    df -h | grep "^/dev"

    echo ""
    echo "🌐 Network I/O:"
    ip -s link | awk '/^[0-9]+: / {print $2} /^[[:space:]]+[RT]X:/ {getline; print $1, $2, $3}'

    echo ""
    echo "📊 Top 5 Processes (by CPU):"
    ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6

    sleep 5
done
