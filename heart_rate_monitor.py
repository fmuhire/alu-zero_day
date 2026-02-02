import time
import random
import sys
from datetime import datetime

LOG_FILE = "hospital_data/active_logs/heart_rate.log"
DEVICES = ["heart_sensor_1", "heart_sensor_2"]

if len(sys.argv) != 2 or sys.argv[1] != "start":
    print("Usage: python3 heart_rate_monitor.py start")
    sys.exit(1)

while True:
    with open(LOG_FILE, "a") as f:
        for device in DEVICES:
            timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            heart_rate = random.randint(60, 100)
            f.write(f"{timestamp} {device} {heart_rate}\n")
    time.sleep(2)
