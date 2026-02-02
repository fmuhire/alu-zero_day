# Hospital Data Monitoring & Archival System

## Overview
This project monitors real-time patient health metrics (heart rate, temperature) and water usage, archives logs, and analyzes data using Linux shell scripts.

## Simulators
Run each simulator in a separate terminal:

1. Heart Rate:
   python3 heart_rate_monitor.py start
2. Temperature:
   python3 temperature_recorder.py start
3. Water Consumption:
   python3 water_consumption.py start

## Archival
Run the archival script to move logs to archive folders:
   ./archive_logs.sh

## Analysis
Run the analysis script to generate reports:
   ./analyze_logs.sh
Reports are saved in `reports/analysis_report.txt`

## Directory Structure
- `hospital_data/active_logs/` → live logs
- `hospital_data/archives/` → archived logs
- `reports/` → analysis reports
