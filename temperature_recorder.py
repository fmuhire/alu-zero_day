import time
import random
import sys
from datetime import datetime

LOG_FILE = "hospital_data/active_logs/temperature.log"
DEVICES = ["temp_sensor_1", "temp_sensor_2"]

if len(sys.argv) != 2 or sys.argv[1] != "start":
    print("Usage: python3 temperature_recorder.py start")
    sys.exit(1)

while True:
    with open(LOG_FILE, "a") as f:
        for device in DEVICES:
            timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            temp = round(random.uniform(36.0, 39.0), 1)
            f.write(f"{timestamp} {device} {temp}\n")
    time.sleep(3)
