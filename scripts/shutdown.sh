#!/bin/bash
set -eo pipefail

userdel --force --remove "${ssh_username}" || true
userdel --force --remove $(cloud-init query system_info.default_user.name) || true

apt-get remove -y open-vm-tools
apt-get autoremove -y

cloud-init clean --logs --machine-id --seed --configs all

poweroff
