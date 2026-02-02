#!/bin/bash

# Directories and files
LOG_DIR="hospital_data/active_logs"
REPORT_FILE="reports/analysis_report.txt"

# Ensure report directory exists
mkdir -p reports

# Menu
echo "Select log file to analyze:"
echo "1) Heart Rate (heart_rate.log)"
echo "2) Temperature (temperature.log)"
echo "3) Water Usage (water_usage.log)"
read -p "Enter choice (1-3): " choice

# Determine file
case $choice in
    1) FILE="$LOG_DIR/heart_rate.log"; LOG_NAME="Heart Rate";;
    2) FILE="$LOG_DIR/temperature.log"; LOG_NAME="Temperature";;
    3) FILE="$LOG_DIR/water_usage.log"; LOG_NAME="Water Usage";;
    *) echo "Invalid choice"; exit 1;;
esac

# Check if file exists
if [ ! -f "$FILE" ]; then
    echo "Log file $FILE not found."
    exit 1
fi

# Analysis
echo "Analyzing $LOG_NAME log..."
echo "Report for $LOG_NAME - $(date)" >> "$REPORT_FILE"
echo "-----------------------------------" >> "$REPORT_FILE"

# Count occurrences per device
awk '{print $2}' "$FILE" | sort | uniq -c >> "$REPORT_FILE"

# Optional: first and last timestamp
echo "First entry: $(head -1 $FILE | awk '{print $1, $2}')" >> "$REPORT_FILE"
echo "Last entry: $(tail -1 $FILE | awk '{print $1, $2}')" >> "$REPORT_FILE"

echo "-----------------------------------" >> "$REPORT_FILE"
echo "Analysis appended to $REPORT_FILE"
