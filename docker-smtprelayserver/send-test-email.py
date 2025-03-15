#!/usr/bin/env python3
from datetime import datetime
from pathlib import Path
import sys
import smtplib

SRIPT_PATH = Path(__file__)

PARAMS_FILE = SRIPT_PATH.parent / ".env"
params = {l[0]: l[1] for l in ((p + "=").split("=") for p in PARAMS_FILE.read_text().splitlines())}

from_addr = params["SMTP_USERNAME"]
to_addr = [from_addr]
subject = f"Sample test notification message at {datetime.now().isoformat()}"
body = f"Hi, this is a test message from {Path(__file__).stem} script. \n- {from_addr}"

email_text = f"From: Sender <{from_addr}>\nTo: {','.join(to_addr)}\nSubject: {subject}\n\n{body}\n"
print(f"RAW MESSAGE:\n{email_text}")

try:
    # server = smtplib.SMTP_SSL("smtp.gmail.com", 465)
    server = smtplib.SMTP("localhost", 25)
    server.ehlo()
    server.debuglevel = 1
    res = server.sendmail(from_addr, to_addr, email_text)
    server.close()

    print(f"Email sent: {res}")
except Exception as ex:  
    print(f"Something went wrong: {ex}")
    sys.exit(1)
