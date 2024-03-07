iso_url      = "https://releases.ubuntu.com/22.04.4/ubuntu-22.04.4-live-server-amd64.iso"
iso_checksum = "sha256:45f873de9f8cb637345d6e66a583762730bbea30277ef7b32c9c3bd6700a32b2"

// To enable this see: https://serverfault.com/questions/1043441/how-to-run-kvm-nested-in-wsl2-or-vmware
accelerator = "kvm"

memory = 4096
cpus = 2

disk_size = "50G"

ssh_username = "ubuntu"
ssh_password = "ubuntu"
ssh_timeout  = "60m"

guest_timezone        = "Europe/London"
guest_locale          = "en_GB.UTF-8"
guest_keyboard_layout = "gb"
