from pyinfra.operations import git, apt, files, server

server.user(
    name="Ensure user markus exists with fish shell",
    user="markus",
    shell="/usr/bin/fish",
    ensure_home=True,
    _sudo=True,
)

packages = [
    "syncthing",
    "syncthingtray",
    "syncthing-gtk"
]

apt.update(
    name="Update apt cache",
    _sudo=True,
)

apt.packages(
    name="Ensure required packages are installed",
    packages=packages,
    _sudo=True,
)

# Set up Syncthing systemd user service for markus
# Create systemd user directory if it doesn't exist
server.shell(
    name="Create systemd user directory for markus",
    commands=[
        "mkdir -p /home/markus/.config/systemd/user",
    ],
    _sudo=True,
    _sudo_user="markus",
)

# Create Syncthing service file
files.put(
    src="files/syncthing.service",
    dest="/home/markus/.config/systemd/user/syncthing.service",
    create_remote_dir=True,
    user="markus",
    group="markus",
    mode="644",
    _sudo=True,
)

# Enable and start the service for user markus
server.shell(
    name="Enable and start Syncthing service for user markus",
    commands=[
        "systemctl --user enable syncthing.service",
        "systemctl --user start syncthing.service",
    ],
    _sudo=True,
    _sudo_user="markus",
)

# Enable lingering for user markus to allow the service to run without user login
server.shell(
    name="Enable lingering for user markus",
    commands=["loginctl enable-linger markus"],
    _sudo=True,
)

# Set higher inotify watches limit for file monitoring tools like Syncthing
files.line(
    name="Set inotify max_user_watches limit",
    path="/etc/sysctl.conf",
    line="fs.inotify.max_user_watches=204800",
    replace=True,
    _sudo=True,
)

# Apply the sysctl changes
server.shell(
    name="Apply sysctl changes",
    commands=["sysctl -p"],
    _sudo=True,
)
