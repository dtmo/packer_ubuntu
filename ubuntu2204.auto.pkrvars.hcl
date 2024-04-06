
disk_size = "50G"

// List available machine types with `qemu-system-x86_64 -machine help`
machine_type = "pc-q35-jammy"

memory = 4096

iso_url      = "https://releases.ubuntu.com/22.04.4/ubuntu-22.04.4-live-server-amd64.iso"
iso_checksum = "sha256:45f873de9f8cb637345d6e66a583762730bbea30277ef7b32c9c3bd6700a32b2"

ssh_username = "ubuntu"
ssh_password = "ubuntu"
ssh_timeout  = "60m"

cpus = 2

guest_timezone        = "Europe/London"
guest_locale          = "en_GB.UTF-8"
guest_keyboard_layout = "gb"
