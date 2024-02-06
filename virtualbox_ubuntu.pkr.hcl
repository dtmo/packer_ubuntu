packer {
  required_plugins {
    virtualbox = {
      version = "~> 1"
      source  = "github.com/hashicorp/virtualbox"
    }
  }
}

source "virtualbox-iso" "ubuntu-2204" {
  # VM Configuration

  chipset            = var.chipset
  firmware           = var.firmware
  nested_virt        = var.nested_virt
  rtc_time_base      = var.rtc_time_base
  disk_size          = var.disk_size
  nic_type           = var.nic_type
  audio_controller   = var.audio_controller
  gfx_vram_size      = var.gfx_vram_size
  gfx_accelerate_3d  = var.gfx_accelerate_3d
  gfx_efi_resolution = var.gfx_efi_resolution

  # Find the available guest_os_type values with the PowerShell command:
  # &$Env:VBOX_MSI_INSTALL_PATH\VBoxManage list ostypes
  guest_os_type = "Ubuntu22_LTS_64"

  hard_drive_discard        = var.hard_drive_discard
  hard_drive_interface      = var.hard_drive_interface
  sata_port_count           = var.sata_port_count
  nvme_port_count           = var.nvme_port_count
  hard_drive_nonrotational  = var.hard_drive_nonrotational
  iso_interface             = var.iso_interface
  disk_additional_size      = var.disk_additional_size
  keep_registered           = var.keep_registered
  skip_export               = var.skip_export
  vm_name                   = var.vm_name
  virtualbox_version_file   = var.virtualbox_version_file
  bundle_iso                = var.bundle_iso
  guest_additions_mode      = var.guest_additions_mode
  guest_additions_interface = var.guest_additions_interface
  guest_additions_path      = var.guest_additions_path
  guest_additions_sha256    = var.guest_additions_sha256
  guest_additions_url       = var.guest_additions_url

  # ISO Configuration

  iso_checksum         = var.iso_checksum
  iso_url              = var.iso_url
  iso_urls             = var.iso_urls
  iso_target_path      = var.iso_target_path
  iso_target_extension = var.iso_target_extension

  # CD configuration

  cd_content = {
    "meta-data" = templatefile("${path.root}/templates/meta-data.pkrtpl", {
    })
    "user-data" = templatefile("${path.root}/templates/user-data.pkrtpl", {
      username              = var.ssh_username
      password              = var.ssh_password
      guest_timezone        = var.guest_timezone
      guest_locale          = var.guest_locale
      guest_keyboard_layout = var.guest_keyboard_layout
    })
  }
  cd_label = "CIDATA"

  # Export Configuration

  format      = var.format
  export_opts = var.export_opts

  # Output Configuration

  output_directory = var.output_directory
  output_filename  = var.output_filename

  # Run Configuration

  headless          = var.headless
  vrdp_bind_address = var.vrdp_bind_address
  vrdp_port_min     = var.vrdp_port_min
  vrdp_port_max     = var.vrdp_port_max

  # Shutdown Configuration

  shutdown_command    = "echo ${var.ssh_password} | sudo -S shutdown -P now"
  shutdown_timeout    = var.shutdown_timeout
  post_shutdown_delay = var.post_shutdown_delay
  disable_shutdown    = var.disable_shutdown
  acpi_shutdown       = var.acpi_shutdown

  # Hardware configuration

  cpus   = var.cpus
  memory = var.memory
  sound  = var.sound
  usb    = var.usb

  # VBox Manage configuration

  vboxmanage      = var.vboxmanage
  vboxmanage_post = var.vboxmanage_post

  # Communicator configuration

  communicator            = var.communicator
  pause_before_connecting = var.pause_before_connecting
  host_port_min           = var.host_port_min
  host_port_max           = var.host_port_max
  skip_nat_mapping        = var.skip_nat_mapping

  # SSH

  ssh_host                     = var.ssh_host
  ssh_port                     = var.ssh_port
  ssh_username                 = var.ssh_username
  ssh_password                 = var.ssh_password
  ssh_ciphers                  = var.ssh_ciphers
  ssh_clear_authorized_keys    = var.ssh_clear_authorized_keys
  ssh_key_exchange_algorithms  = var.ssh_key_exchange_algorithms
  ssh_certificate_file         = var.ssh_certificate_file
  ssh_pty                      = var.ssh_pty
  ssh_timeout                  = var.ssh_timeout
  ssh_disable_agent_forwarding = var.ssh_disable_agent_forwarding
  ssh_handshake_attempts       = var.ssh_handshake_attempts
  ssh_bastion_host             = var.ssh_bastion_host
  ssh_bastion_port             = var.ssh_bastion_port
  ssh_bastion_agent_auth       = var.ssh_bastion_agent_auth
  ssh_bastion_username         = var.ssh_bastion_username
  ssh_bastion_password         = var.ssh_bastion_password
  ssh_bastion_interactive      = var.ssh_bastion_interactive
  ssh_bastion_private_key_file = var.ssh_bastion_private_key_file
  ssh_bastion_certificate_file = var.ssh_bastion_certificate_file
  ssh_file_transfer_method     = var.ssh_file_transfer_method
  ssh_proxy_host               = var.ssh_proxy_host
  ssh_proxy_port               = var.ssh_proxy_port
  ssh_proxy_username           = var.ssh_proxy_username
  ssh_proxy_password           = var.ssh_proxy_password
  ssh_keep_alive_interval      = var.ssh_keep_alive_interval
  ssh_read_write_timeout       = var.ssh_read_write_timeout
  ssh_remote_tunnels           = var.ssh_remote_tunnels
  ssh_local_tunnels            = var.ssh_local_tunnels
  ssh_private_key_file         = var.ssh_private_key_file
  ssh_agent_auth               = var.ssh_agent_auth

  # Boot Configuration

  boot_keygroup_interval = var.boot_keygroup_interval
  boot_wait              = var.boot_wait
  boot_command           = [
    "e<down><down><down><end>",
    " autoinstall ds=nocloud;",
    "<F10>"
  ]
}

build {
  sources = ["sources.virtualbox-iso.ubuntu-2204"]
  provisioner "shell" {
    expect_disconnect = true
    execute_command = "chmod +x {{ .Path }}; echo '${var.ssh_password}' | sudo -S sh -c '{{ .Vars }} {{ .Path }}'"
    inline_shebang = "/bin/bash -x"
    inline = [
      # Install VirtualBox Guest Additions
      "mkdir /media/vbox",
      "mount /dev/sr1 /media/vbox",
      "sh /media/vbox/VBoxLinuxAdditions.run",
      "reboot",
    ]
  }
  provisioner "shell" {
    // pause_before = "10s"
    execute_command = "chmod +x {{ .Path }}; echo '${var.ssh_password}' | sudo -S sh -c '{{ .Vars }} {{ .Path }}'"
    inline_shebang = "/bin/bash -ex"
    inline = [
      "apt-get remove -y open-vm-tools",
      "apt-get autoremove -y",
      "cloud-init clean --logs --machine-id"
    ]
  }
}
