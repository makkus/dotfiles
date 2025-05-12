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
