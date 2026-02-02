import time
import random
import sys
from datetime import datetime

LOG_FILE = "hospital_data/active_logs/water_usage.log"
DEVICE = "water_meter_1"

if len(sys.argv) != 2 or sys.argv[1] != "start":
    print("Usage: python3 water_consumption.py start")
    sys.exit(1)

while True:
    with open(LOG_FILE, "a") as f:
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        usage = random.randint(5, 30)
        f.write(f"{timestamp} {DEVICE} {usage}\n")
    time.sleep(5)
