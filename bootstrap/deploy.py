import socket
import os
from pyinfra import local

hostname = socket.gethostname()


script_dir = os.path.dirname(os.path.abspath(__file__))
tasks_file = os.path.join(script_dir, f"{hostname}_tasks.py")

if os.path.exists(tasks_file):
    local.include(filename=tasks_file)