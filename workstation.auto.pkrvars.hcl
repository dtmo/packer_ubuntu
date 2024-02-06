firmware             = "efi"
disk_size            = 250000
gfx_controller       = "vmsvga"
gfx_vram_size        = 64
gfx_accelerate_3d    = true
hard_drive_interface = "pcie"
vm_name              = "Ubuntu 2204 Workstation"
guest_additions_mode = "attach"

iso_checksum = "SHA256:a4acfda10b18da50e2ec50ccaf860d7f20b389df8765611142305c0e911d16fd"
iso_url      = "https://releases.ubuntu.com/22.04.3/ubuntu-22.04.3-live-server-amd64.iso"

# iso_checksum = "SHA256:a435f6f393dda581172490eda9f683c32e495158a780b5a1de422ee77d98e909"
# iso_url      = "https://releases.ubuntu.com/22.04.3/ubuntu-22.04.3-desktop-amd64.iso"

cpus   = 4
memory = 4096

ssh_username = "ubuntu"
ssh_password = "ubuntu"
ssh_timeout  = "30m"

boot_wait = "5s"

guest_timezone        = "Europe/London"
guest_locale          = "en_GB.UTF-8"
guest_keyboard_layout = "gb"
