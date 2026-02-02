#!/bin/bash

echo "Select log file to analyze:"
echo "1) Heart Rate (heart_rate.log)"
echo "2) Temperature (temperature.log)"
echo "3) Water Usage (water_usage.log)"
read -p "Enter choice (1-3): " choice

if [[ ! $choice =~ ^[1-3]$ ]]; then
    echo "Invalid selection. Please enter 1, 2, or 3."
    exit 1
fi

case $choice in
    1) logfile="hospital_data/active_logs/heart_rate.log" ;;
    2) logfile="hospital_data/active_logs/temperature.log" ;;
    3) logfile="hospital_data/active_logs/water_usage.log" ;;
esac

if [ ! -f "$logfile" ]; then
    echo "Error: Log file $logfile not found."
    exit 1
fi

