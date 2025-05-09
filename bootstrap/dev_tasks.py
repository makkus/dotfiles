from pyinfra.operations import git, apt, files, server

server.user(
    name="Ensure user markus exists with fish shell",
    user="markus",
    shell="/usr/bin/fish",
    ensure_home=True,
    _sudo=True,
)

packages = [
    "fish",
    "emacs",
    "zile",
    "npm"
]

apt.key(
    name="Add Microsoft GPG key",
    src="https://packages.microsoft.com/keys/microsoft.asc",
    _sudo=True,
)


apt.repo(
    name="Add VS Code repository",
    src="deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main",
    filename="vscode",
    _sudo=True,
)

apt.update(
    name="Update apt cache",
    _sudo=True,
)

apt.packages(
    name="Ensure required packages are installed",
    packages=packages,
    _sudo=True,
)

apt.packages(
    name="Install Visual Studio Code",
    packages=["code"],
    _sudo=True,
)

server.shell(
    name="Export VS Code from distrobox container",
    commands=["distrobox-export --app code"],
)