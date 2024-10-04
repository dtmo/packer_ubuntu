accelerator = "kvm"

disk_size = "50G"

// List available machine types with `qemu-system-x86_64 -machine help`
machine_type = "q35"

memory = 4096

iso_url      = "https://releases.ubuntu.com/24.04/ubuntu-24.04.1-live-server-amd64.iso"
iso_checksum = "file:https://releases.ubuntu.com/24.04/SHA256SUMS"

ssh_username = "ubuntu"
ssh_password = "ubuntu"
ssh_timeout  = "60m"

cpus = 2

guest_timezone        = "Europe/London"
guest_locale          = "en_GB.UTF-8"
guest_keyboard_layout = "gb"
