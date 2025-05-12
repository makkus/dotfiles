from pyinfra.operations import apt
from pyinfra import host

base_packages = [
    "zile",
    "pass",
    "fish",
    "util-linux-user",
    "emacs",
]

system_packages= [
    "yubikey-manager",
    "pcsc-tools",
    "distrobox"
]

dev_packages = [
    "sqlite3",
    "gcc-c++"
]

desktop_packages = [
    "browserpass",
    "browserpass-firefox",
    "browserpass-chromium",
    "meld",
    "sway",
    "waybar",
    "wob",
    "fuzzel",
    "swayidle",
    "lxpolkit",
    "network-manager-applet",
    "blueman",
    "thunderbird",
    "dunst",
    "mozilla-fira-sans-fonts",
    "google-noto-sans-fonts",
    "brightnessctl",
    "pavucontrol",
    "powerprofilesctl",
    "seahorse",
]

packages = []

if host.data.get("install_base_packages", True):
    packages += base_packages
    
if host.data.get("install_system_packages", True):    
    packages += system_packages

if host.data.get("install_desktop_packages", True):
    packages += desktop_packages


if host.data.get("install_dev_packages", True):
    packages += dev_packages

if packages:
    apt.packages(
        name="Ensure required packages are installed",
        packages=packages,
        _sudo=True,  # use sudo when installing the packages
)