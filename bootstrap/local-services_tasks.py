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
