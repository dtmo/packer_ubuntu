#!/bin/bash
set -eo pipefail

userdel --force --remove "$(logname)" || true
userdel --force --remove "$(cloud-init query system_info.default_user.name)" || true

cloud-init clean --logs --machine-id --seed --configs all

poweroff
