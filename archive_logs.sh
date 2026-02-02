#!/bin/bash

# Directories
LOG_DIR="hospital_data/active_logs"
ARCHIVE_DIR_HEART="hospital_data/archives/heart_data_archive"
ARCHIVE_DIR_TEMP="hospital_data/archives/temp_data_archive"
ARCHIVE_DIR_WATER="hospital_data/archives/water_data_archive"

# Create archive directories if they don't exist
mkdir -p "$ARCHIVE_DIR_HEART" "$ARCHIVE_DIR_TEMP" "$ARCHIVE_DIR_WATER"

# Menu
echo "Select log to archive:"
echo "1) Heart Rate"
echo "2) Temperature"
echo "3) Water Usage"
read -p "Enter choice (1-3): " choice

case $choice in
    1) FILE="$LOG_DIR/heart_rate.log"; ARCHIVE="$ARCHIVE_DIR_HEART"; LOG_NAME="heart_rate";;
    2) FILE="$LOG_DIR/temperature.log"; ARCHIVE="$ARCHIVE_DIR_TEMP"; LOG_NAME="temperature";;
    3) FILE="$LOG_DIR/water_usage.log"; ARCHIVE="$ARCHIVE_DIR_WATER"; LOG_NAME="water_usage";;
    *) echo "Invalid choice"; exit 1;;
esac

# Check if file exists
if [ ! -f "$FILE" ]; then
    echo "Log file $FILE not found."
    exit 1
fi

# Archive
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
ARCHIVE_FILE="$ARCHIVE/${LOG_NAME}_${TIMESTAMP}.log"

mv "$FILE" "$ARCHIVE_FILE"
touch "$FILE"

echo "Successfully archived $LOG_NAME.log to $ARCHIVE_FILE"

