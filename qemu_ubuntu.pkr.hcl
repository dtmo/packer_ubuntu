packer {
  required_plugins {
    qemu = {
      version = "~> 1"
      source  = "github.com/hashicorp/qemu"
    }
  }
}

source "qemu" "ubuntu2204" {
  # Qemu Specific Configuration

  iso_skip_cache       = var.iso_skip_cache
  accelerator          = var.accelerator
  disk_additional_size = var.disk_additional_size
  firmware             = var.firmware
  use_pflash           = var.use_pflash
  disk_interface       = var.disk_interface
  disk_size            = var.disk_size
  skip_resize_disk     = var.skip_resize_disk
  disk_cache           = var.disk_cache
  disk_discard         = var.disk_discard
  disk_detect_zeroes   = var.disk_detect_zeroes
  skip_compaction      = var.skip_compaction
  disk_compression     = var.disk_compression
  format               = var.format
  headless             = var.headless
  disk_image           = var.disk_image
  use_backing_file     = var.use_backing_file
  machine_type         = var.machine_type
  memory               = var.memory
  net_device           = var.net_device
  net_bridge           = var.net_bridge
  output_directory     = var.output_directory
  qemuargs             = var.qemuargs

  qemu_img_args {
  }

  qemu_binary         = var.qemu_binary
  qmp_enable          = var.qmp_enable
  qmp_socket_path     = var.qmp_socket_path
  use_default_display = var.use_default_display
  vga                 = var.vga
  display             = var.display
  vnc_bind_address    = var.vnc_bind_address
  vnc_use_password    = var.vnc_use_password
  vnc_port_min        = var.vnc_port_min
  vnc_port_max        = var.vnc_port_max
  vm_name             = var.vm_name
  cdrom_interface     = var.cdrom_interface
  vtpm                = var.vtpm
  use_tpm1            = var.use_tpm1
  tpm_device_type     = var.tpm_device_type
  boot_steps          = var.boot_steps
  cpu_model           = var.cpu_model

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

  # Shutdown configuration

  shutdown_command = "echo ${var.ssh_password} | sudo -S shutdown -P now"
  shutdown_timeout = var.shutdown_timeout

  # Communicator configuration

  communicator                 = var.communicator
  pause_before_connecting      = var.pause_before_connecting
  host_port_min                = var.host_port_min
  host_port_max                = var.host_port_max
  skip_nat_mapping             = var.skip_nat_mapping
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
  winrm_username               = var.winrm_username
  winrm_password               = var.winrm_password
  winrm_host                   = var.winrm_host
  winrm_no_proxy               = var.winrm_no_proxy
  winrm_port                   = var.winrm_port
  winrm_timeout                = var.winrm_timeout
  winrm_use_ssl                = var.winrm_use_ssl
  winrm_insecure               = var.winrm_insecure
  winrm_use_ntlm               = var.winrm_use_ntlm

  # Boot Configuration

  disable_vnc            = var.disable_vnc
  boot_key_interval      = var.boot_key_interval
  boot_keygroup_interval = var.boot_keygroup_interval
  boot_wait              = var.boot_wait
  boot_command           = [
    "e<down><down><down><end>",
    " net.ifnames=0 autoinstall ds=nocloud;",
    "<F10>"
  ]

  # EFI Boot Configuration

  efi_boot          = var.efi_boot
  efi_firmware_code = var.efi_firmware_code
  efi_firmware_vars = var.efi_firmware_vars
  efi_drop_efivars  = var.efi_drop_efivars

  # SMP Configuration

  cpus    = var.cpus
  sockets = var.sockets
  cores   = var.cores
  threads = var.threads
}

build {
  sources = ["source.qemu.ubuntu2204"]

  provisioner "shell" {
    execute_command = "chmod +x {{ .Path }}; echo '${var.ssh_password}' | sudo -S sh -c '{{ .Vars }} {{ .Path }}'"
    inline_shebang = "/bin/bash -ex"
    inline = [
      "apt-get remove -y open-vm-tools",
      "apt-get autoremove -y",
      // "cloud-init clean --logs --machine-id",
      "echo uninitialized > /etc/machine-id"
    ]
  }
}
