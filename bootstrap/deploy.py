import socket
import os
from pyinfra import local

hostname = socket.gethostname()


tasks_file = f"{hostname}_tasks.py"
if os.path.exists(tasks_file):
    local.include(filename=tasks_file)