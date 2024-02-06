## VM Configuration

variable "chipset" {
  type        = string
  description = "The chipset to be used: PIIX3 or ICH9. When set to piix3, the firmare is PIIX3. This is the default. When set to ich9, the firmare is ICH9."
  default     = null
}

variable "firmware" {
  type        = string
  description = "The firwmware to be used: BIOS or EFI. When set to bios, the firmware is BIOS. This is the default. When set to efi, the firmare is EFI."
  default     = null
}

variable "nested_virt" {
  type        = bool
  description = "Nested virtualization: false or true. When set to true, nested virtualisation (VT-x/AMD-V) is enabled. When set to false, nested virtualisation is disabled. This is the default."
  default     = null
}

variable "rtc_time_base" {
  type        = string
  description = "RTC time base: UTC or local. When set to \"UTC\", the RTC is set as UTC time. When set to \"local\", the RTC is set as local time. This is the default."
  default     = null
}

variable "disk_size" {
  type        = number
  description = "The size, in megabytes, of the hard disk to create for the VM. By default, this is 40000 (about 40 GB)."
  default     = null
}

variable "nic_type" {
  type        = string
  description = "The NIC type to be used for the network interfaces. When set to 82540EM, the NICs are Intel PRO/1000 MT Desktop (82540EM). This is the default. When set to 82543GC, the NICs are Intel PRO/1000 T Server (82543GC). When set to 82545EM, the NICs are Intel PRO/1000 MT Server (82545EM). When set to Am79C970A, the NICs are AMD PCNet-PCI II network card (Am79C970A). When set to Am79C973, the NICs are AMD PCNet-FAST III network card (Am79C973). When set to Am79C960, the NICs are AMD PCnet-ISA/NE2100 (Am79C960). When set to virtio, the NICs are VirtIO."
  default     = null
}

variable "audio_controller" {
  type        = string
  description = "The audio controller type to be used. When set to ac97, the audio controller is ICH AC97. This is the default. When set to hda, the audio controller is Intel HD Audio. When set to sb16, the audio controller is SoundBlaster 16."
  default     = null
}

variable "gfx_controller" {
  type        = string
  description = "The graphics controller type to be used. When set to vboxvga, the graphics controller is VirtualBox VGA. This is the default. When set to vboxsvga, the graphics controller is VirtualBox SVGA. When set to vmsvga, the graphics controller is VMware SVGA. When set to none, the graphics controller is disabled."
  default     = null
}

variable "gfx_vram_size" {
  type        = number
  description = "The VRAM size to be used. By default, this is 4 MiB."
  default     = null
}

variable "gfx_accelerate_3d" {
  type        = bool
  description = "3D acceleration: true or false. When set to true, 3D acceleration is enabled. When set to false, 3D acceleration is disabled. This is the default."
  default     = null
}

variable "gfx_efi_resolution" {
  type        = string
  description = "Screen resolution in EFI mode: WIDTHxHEIGHT. When set to WIDTHxHEIGHT, it provides the given width and height as screen resolution to EFI, for example 1920x1080 for Full-HD resolution. By default, no screen resolution is set. Note, that this option only affects EFI boot, not the (default) BIOS boot."
  default     = null
}

variable "hard_drive_discard" {
  type        = bool
  description = "When this value is set to true, a VDI image will be shrunk in response to the trim command from the guest OS. The size of the cleared area must be at least 1MB. Also set hard_drive_nonrotational to true to enable TRIM support."
  default     = null
}

variable "hard_drive_interface" {
  type        = string
  description = "The type of controller that the primary hard drive is attached to, defaults to ide. When set to sata, the drive is attached to an AHCI SATA controller. When set to scsi, the drive is attached to an LsiLogic SCSI controller. When set to pcie, the drive is attached to an NVMe controller. When set to virtio, the drive is attached to a VirtIO controller. Please note that when you use \"pcie\", you'll need to have Virtualbox 6, install an extension pack and you will need to enable EFI mode for nvme to work"
  default     = null
}

variable "sata_port_count" {
  type        = number
  description = "The number of ports available on any SATA controller created, defaults to 1. VirtualBox supports up to 30 ports on a maximum of 1 SATA controller. Increasing this value can be useful if you want to attach additional drives."
  default     = null
}

variable "nvme_port_count" {
  type        = number
  description = "The number of ports available on any NVMe controller created, defaults to 1. VirtualBox supports up to 255 ports on a maximum of 1 NVMe controller. Increasing this value can be useful if you want to attach additional drives."
  default     = null
}

variable "hard_drive_nonrotational" {
  type        = bool
  description = "Forces some guests (i.e. Windows 7+) to treat disks as SSDs and stops them from performing disk fragmentation. Also set hard_drive_discard to true to enable TRIM support."
  default     = null
}

variable "iso_interface" {
  type        = string
  description = "The type of controller that the ISO is attached to, defaults to ide. When set to sata, the drive is attached to an AHCI SATA controller. When set to virtio, the drive is attached to a VirtIO controller."
  default     = null
}

variable "disk_additional_size" {
  type        = list(number)
  description = "Additional disks to create. Uses vm_name as the disk name template and appends -# where # is the position in the array. # starts at 1 since 0 is the default disk. Each value represents the disk image size in MiB. Each additional disk uses the same disk parameters as the default disk. Unset by default."
  default     = null
}

variable "keep_registered" {
  type        = bool
  description = "Set this to true if you would like to keep the VM registered with virtualbox. Defaults to false."
  default     = null
}

variable "skip_export" {
  type        = bool
  description = "Defaults to false. When enabled, Packer will not export the VM. Useful if the build output is not the resultant image, but created inside the VM."
  default     = null
}

variable "vm_name" {
  type        = string
  description = "This is the name of the OVF file for the new virtual machine, without the file extension. By default this is packer-BUILDNAME, where \"BUILDNAME\" is the name of the build."
  default     = null
}

variable "virtualbox_version_file" {
  type        = string
  description = "The path within the virtual machine to upload a file that contains the VirtualBox version that was used to create the machine. This information can be useful for provisioning. By default this is .vbox_version, which will generally be upload it into the home directory. Set to an empty string to skip uploading this file, which can be useful when using the none communicator."
  default     = null
}

variable "bundle_iso" {
  type        = bool
  description = "Defaults to false. When enabled, Packer includes any attached ISO disc devices into the final virtual machine. Useful for some live distributions that require installation media to continue to be attached after installation."
  default     = null
}

variable "guest_additions_mode" {
  type        = string
  description = "The method by which guest additions are made available to the guest for installation. Valid options are upload, attach, or disable. If the mode is attach the guest additions ISO will be attached as a CD device to the virtual machine. If the mode is upload the guest additions ISO will be uploaded to the path specified by guest_additions_path. The default value is upload. If disable is used, guest additions won't be downloaded, either."
  default     = null
}

variable "guest_additions_interface" {
  type        = string
  description = "The interface type to use to mount guest additions when guest_additions_mode is set to attach. Will default to the value set in iso_interface, if iso_interface is set. Will default to \"ide\", if iso_interface is not set. Options are \"ide\" and \"sata\"."
  default     = null
}

variable "guest_additions_path" {
  type        = string
  description = "The path on the guest virtual machine where the VirtualBox guest additions ISO will be uploaded. By default this is VBoxGuestAdditions.iso which should upload into the login directory of the user. This is a configuration template where the Version variable is replaced with the VirtualBox version."
  default     = null
}

variable "guest_additions_sha256" {
  type        = string
  description = "The SHA256 checksum of the guest additions ISO that will be uploaded to the guest VM. By default the checksums will be downloaded from the VirtualBox website, so this only needs to be set if you want to be explicit about the checksum."
  default     = null
}

variable "guest_additions_url" {
  type        = string
  description = "The URL of the guest additions ISO to upload. This can also be a file URL if the ISO is at a local path. By default, the VirtualBox builder will attempt to find the guest additions ISO on the local file system. If it is not available locally, the builder will download the proper guest additions ISO from the internet."
  default     = null
}

## ISO Configuration

variable "iso_checksum" {
  type        = string
  description = "The checksum for the ISO file or virtual hard drive file. The type of the checksum is specified within the checksum field as a prefix, ex: \"md5:{$checksum}\". The type of the checksum can also be omitted and Packer will try to infer it based on string length. Valid values are \"none\", \"{$checksum}\", \"md5:{$checksum}\", \"sha1:{$checksum}\", \"sha256:{$checksum}\", \"sha512:{$checksum}\" or \"file:{$path}\". Although the checksum will not be verified when it is set to \"none\", this is not recommended since these files can be very large and corruption does happen from time to time."
}

variable "iso_url" {
  type        = string
  description = "A URL to the ISO containing the installation image or virtual hard drive (VHD or VHDX) file to clone."
}

variable "iso_urls" {
  type        = list(string)
  description = "Multiple URLs for the ISO to download. Packer will try these in order. If anything goes wrong attempting to download or while downloading a single URL, it will move on to the next. All URLs must point to the same file (same checksum). By default this is empty and iso_url is used. Only one of iso_url or iso_urls can be specified."
  default     = null
}

variable "iso_target_path" {
  type        = string
  description = "The path where the iso should be saved after download. By default will go in the packer cache, with a hash of the original filename and checksum as its name."
  default     = null
}

variable "iso_target_extension" {
  type        = string
  description = "The extension of the iso file after download. This defaults to iso."
  default     = null
}

## Export Configuration

variable "format" {
  type        = string
  description = "Either ovf or ova, this specifies the output format of the exported virtual machine. This defaults to ovf."
  default     = null
}

variable "export_opts" {
  type        = list(string)
  description = "Additional options to pass to the VBoxManage export. This can be useful for passing product information to include in the resulting appliance file."
  default     = null
}

## Output Configuration

variable "output_directory" {
  type        = string
  description = "This is the path to the directory where the resulting virtual machine will be created. This may be relative or absolute. If relative, the path is relative to the working directory when packer is executed. This directory must not exist or be empty prior to running the builder. By default this is output-BUILDNAME where \"BUILDNAME\" is the name of the build."
  default     = null
}

variable "output_filename" {
  type        = string
  description = "This is the base name of the file (excluding the file extension) where the resulting virtual machine will be created. By default this is the vm_name."
  default     = null
}

## Run configuration

variable "headless" {
  type        = bool
  description = "Packer defaults to building VirtualBox virtual machines by launching a GUI that shows the console of the machine being built. When this value is set to true, the machine will start without a console."
  default     = null
}

variable "vrdp_bind_address" {
  type        = string
  description = "The IP address that should be binded to for VRDP. By default packer will use 127.0.0.1 for this. If you wish to bind to all interfaces use 0.0.0.0."
  default     = null
}

variable "vrdp_port_min" {
  type        = number
  description = "The minimum and maximum port to use for VRDP access to the virtual machine. Packer uses a randomly chosen port in this range that appears available. By default this is 5900 to 6000. The minimum and maximum ports are inclusive."
  default     = null
}

variable "vrdp_port_max" {
  type        = number
  description = "VRDP Port Max"
  default     = null
}

## Shutdown configuration

variable "shutdown_timeout" {
  type        = string
  description = "The amount of time to wait after executing the shutdown_command for the virtual machine to actually shut down. If it doesn't shut down in this time, it is an error. By default, the timeout is 5m or five minutes. ex: \"1h5m2s\"."
  default     = null
}

variable "post_shutdown_delay" {
  type        = string
  description = "The amount of time to wait after shutting down the virtual machine. If you get the error Error removing floppy controller, you might need to set this to 5m or so. By default, the delay is 0s or disabled. ex: \"1h5m2s\"."
  default     = null
}

variable "disable_shutdown" {
  type        = bool
  description = "Packer normally halts the virtual machine after all provisioners have run when no shutdown_command is defined. If this is set to true, Packer will not halt the virtual machine but will assume that you will send the stop signal yourself through the preseed.cfg or your final provisioner. Packer will wait for a default of 5 minutes until the virtual machine is shutdown. The timeout can be changed using shutdown_timeout option."
  default     = null
}

variable "acpi_shutdown" {
  type        = bool
  description = "If it's set to true, it will shutdown the VM via power button. It could be a good option when keeping the machine state is necessary after shutting it down."
  default     = null
}

## Hardware configuration

variable "cpus" {
  type        = number
  description = "The number of cpus to use for building the VM. Defaults to 1."
  default     = null
}

variable "memory" {
  type        = number
  description = "The amount of memory to use for building the VM in megabytes. Defaults to 512 megabytes."
  default     = null
}

variable "sound" {
  type        = string
  description = "Defaults to none. The type of audio device to use for sound when building the VM. Some of the options that are available are dsound, oss, alsa, pulse, coreaudio, null."
  default     = null
}

variable "usb" {
  type        = bool
  description = "Specifies whether or not to enable the USB bus when building the VM. Defaults to false."
  default     = null
}

## VBox Manage configuration

variable "vboxmanage" {
  type        = list(list(string))
  description = "Custom VBoxManage commands to execute in order to further customize the virtual machine being created."
  default     = null
}

variable "vboxmanage_post" {
  type        = list(list(string))
  description = "Identical to vboxmanage, except that it is run after the virtual machine is shutdown, and before the virtual machine is exported."
  default     = null
}

## Communicator configuration

variable "communicator" {
  type        = string
  description = "Packer currently supports three kinds of communicators: \"none\" - No communicator will be used. If this is set, most provisioners also can't be used. \"ssh\" - An SSH connection will be established to the machine. This is usually the default. \"winrm\" - A WinRM connection will be established."
  default     = null
}

variable "pause_before_connecting" {
  type        = string
  description = "We recommend that you enable SSH or WinRM as the very last step in your guest's bootstrap script, but sometimes you may have a race condition where you need Packer to wait before attempting to connect to your guest. If you end up in this situation, you can use the template option pause_before_connecting. By default, there is no pause. For example if you set pause_before_connecting to 10m Packer will check whether it can connect, as normal. But once a connection attempt is successful, it will disconnect and then wait 10 minutes before connecting to the guest and beginning provisioning. ex: \"1h5m2s\""
  default     = null
}

variable "host_port_min" {
  type        = number
  description = "The minimum port to use for the Communicator port on the host machine which is forwarded to the SSH or WinRM port on the guest machine. By default this is 2222."
  default     = null
}

variable "host_port_max" {
  type        = number
  description = "The maximum port to use for the Communicator port on the host machine which is forwarded to the SSH or WinRM port on the guest machine. Because Packer often runs in parallel, Packer will choose a randomly available port in this range to use as the host port. By default this is 4444."
  default     = null
}

variable "skip_nat_mapping" {
  type        = bool
  description = "Defaults to false. When enabled, Packer does not setup forwarded port mapping for communicator (SSH or WinRM) requests and uses ssh_port or winrm_port on the host to communicate to the virtual machine."
  default     = null
}

## SSH

variable "ssh_host" {
  type        = string
  description = "The address to SSH to. This usually is automatically configured by the builder."
  default     = null
}

variable "ssh_port" {
  type        = number
  description = "The port to connect to SSH. This defaults to 22."
  default     = null
}

variable "ssh_username" {
  type        = string
  description = "The username to connect to SSH with. Required if using SSH."
  default     = null
}

variable "ssh_password" {
  type        = string
  description = "A plaintext password to use to authenticate with SSH."
  default     = null
}

variable "ssh_ciphers" {
  type        = list(string)
  description = "This overrides the value of ciphers supported by default by Golang. The default value is [ \"aes128-gcm@openssh.com\", \"chacha20-poly1305@openssh.com\", \"aes128-ctr\", \"aes192-ctr\", \"aes256-ctr\",]. Valid options for ciphers include: \"aes128-ctr\", \"aes192-ctr\", \"aes256-ctr\", \"aes128-gcm@openssh.com\", \"chacha20-poly1305@openssh.com\", \"arcfour256\", \"arcfour128\", \"arcfour\", \"aes128-cbc\", \"3des-cbc\","
  default     = null
}

variable "ssh_clear_authorized_keys" {
  type        = bool
  description = "If true, Packer will attempt to remove its temporary key from ~/.ssh/authorized_keys and /root/.ssh/authorized_keys. This is a mostly cosmetic option, since Packer will delete the temporary private key from the host system regardless of whether this is set to true (unless the user has set the -debug flag). Defaults to \"false\"; currently only works on guests with sed installed."
  default     = null
}

variable "ssh_key_exchange_algorithms" {
  type        = list(string)
  description = "If set, Packer will override the value of key exchange (kex) algorithms supported by default by Golang. Acceptable values include: \"curve25519-sha256@libssh.org\", \"ecdh-sha2-nistp256\", \"ecdh-sha2-nistp384\", \"ecdh-sha2-nistp521\", \"diffie-hellman-group14-sha1\", and \"diffie-hellman-group1-sha1\"."
  default     = null
}

variable "ssh_certificate_file" {
  type        = string
  description = "Path to user certificate used to authenticate with SSH. The ~ can be used in path and will be expanded to the home directory of current user."
  default     = null
}

variable "ssh_pty" {
  type        = bool
  description = "If true, a PTY will be requested for the SSH connection. This defaults to false."
  default     = null
}

variable "ssh_timeout" {
  type        = string
  description = "The time to wait for SSH to become available. Packer uses this to determine when the machine has booted so this is usually quite long. Example value: 10m. This defaults to 5m, unless ssh_handshake_attempts is set. ex: \"1h5m2s\""
  default     = null
}

variable "ssh_disable_agent_forwarding" {
  type        = bool
  description = "If true, SSH agent forwarding will be disabled. Defaults to false."
  default     = null
}

variable "ssh_handshake_attempts" {
  type        = number
  description = "The number of handshakes to attempt with SSH once it can connect. This defaults to 10, unless a ssh_timeout is set."
  default     = null
}

variable "ssh_bastion_host" {
  type        = string
  description = "A bastion host to use for the actual SSH connection."
  default     = null
}

variable "ssh_bastion_port" {
  type        = number
  description = "The port of the bastion host. Defaults to 22."
  default     = null
}

variable "ssh_bastion_agent_auth" {
  type        = bool
  description = "If true, the local SSH agent will be used to authenticate with the bastion host. Defaults to false."
  default     = null
}

variable "ssh_bastion_username" {
  type        = string
  description = "The username to connect to the bastion host."
  default     = null
}

variable "ssh_bastion_password" {
  type        = string
  description = "The password to use to authenticate with the bastion host."
  default     = null
}

variable "ssh_bastion_interactive" {
  type        = bool
  description = "If true, the keyboard-interactive used to authenticate with bastion host."
  default     = null
}

variable "ssh_bastion_private_key_file" {
  type        = string
  description = "Path to a PEM encoded private key file to use to authenticate with the bastion host. The ~ can be used in path and will be expanded to the home directory of current user."
  default     = null
}

variable "ssh_bastion_certificate_file" {
  type        = string
  description = "Path to user certificate used to authenticate with bastion host. The ~ can be used in path and will be expanded to the home directory of current user."
  default     = null
}

variable "ssh_file_transfer_method" {
  type        = string
  description = "scp or sftp - How to transfer files, Secure copy (default) or SSH File Transfer Protocol. NOTE: Guests using Windows with Win32-OpenSSH v9.1.0.0p1-Beta, scp (the default protocol for copying data) returns a a non-zero error code since the MOTW cannot be set, which cause any file transfer to fail. As a workaround you can override the transfer protocol with SFTP instead ssh_file_transfer_protocol = \"sftp\"."
  default     = null
}

variable "ssh_proxy_host" {
  type        = string
  description = "A SOCKS proxy host to use for SSH connection"
  default     = null
}

variable "ssh_proxy_port" {
  type        = number
  description = "A port of the SOCKS proxy. Defaults to 1080."
  default     = null
}

variable "ssh_proxy_username" {
  type        = string
  description = "The optional username to authenticate with the proxy server."
  default     = null
}

variable "ssh_proxy_password" {
  type        = string
  description = "The optional password to use to authenticate with the proxy server."
  default     = null
}

variable "ssh_keep_alive_interval" {
  type        = string
  description = "How often to send \"keep alive\" messages to the server. Set to a negative value (-1s) to disable. ex: \"1h5m2s\" Example value: 10s. Defaults to 5s."
  default     = null
}

variable "ssh_read_write_timeout" {
  type        = string
  description = "The amount of time to wait for a remote command to end. This might be useful if, for example, packer hangs on a connection after a reboot. ex: \"1h5m2s\" Example: 5m. Disabled by default."
  default     = null
}

variable "ssh_remote_tunnels" {
  type        = list(string)
  description = ""
  default     = null
}

variable "ssh_local_tunnels" {
  type        = list(string)
  description = ""
  default     = null
}

variable "ssh_private_key_file" {
  type        = string
  description = "Path to a PEM encoded private key file to use to authenticate with SSH. The ~ can be used in path and will be expanded to the home directory of current user."
  default     = null
}

variable "ssh_agent_auth" {
  type        = bool
  description = "If true, the local SSH agent will be used to authenticate connections to the source instance. No temporary keypair will be created, and the values of ssh_password and ssh_private_key_file will be ignored. The environment variable SSH_AUTH_SOCK must be set for this option to work properly."
  default     = null
}

## WinRM

variable "winrm_username" {
  type        = string
  description = "The username to use to connect to WinRM."
  default     = null
}

variable "winrm_password" {
  type        = string
  description = "The password to use to connect to WinRM."
  default     = null
}

variable "winrm_host" {
  type        = string
  description = "The address for WinRM to connect to. NOTE: If using an Amazon EBS builder, you can specify the interface WinRM connects to via ssh_interface."
  default     = null
}

variable "winrm_no_proxy" {
  type        = bool
  description = "Setting this to true adds the remote host:port to the NO_PROXY environment variable. This has the effect of bypassing any configured proxies when connecting to the remote host. Default to false."
  default     = null
}

variable "winrm_port" {
  type        = number
  description = "The WinRM port to connect to. This defaults to 5985 for plain unencrypted connection and 5986 for SSL when winrm_use_ssl is set to true."
  default     = null
}

variable "winrm_timeout" {
  type        = string
  description = "The amount of time to wait for WinRM to become available. This defaults to 30m since setting up a Windows machine generally takes a long time.  ex: \"1h5m2s\""
  default     = null
}

variable "winrm_use_ssl" {
  type        = bool
  description = "If true, use HTTPS for WinRM."
  default     = null
}

variable "winrm_insecure" {
  type        = bool
  description = "If true, do not check server certificate chain and host name."
  default     = null
}

variable "winrm_use_ntlm" {
  type        = bool
  description = "If true, NTLMv2 authentication (with session security) will be used for WinRM, rather than default (basic authentication), removing the requirement for basic authentication to be enabled within the target guest. Further reading for remote connection authentication can be found here."
  default     = null
}

## Boot Configuration

variable "boot_keygroup_interval" {
  type        = string
  description = "Time to wait after sending a group of key pressses. The value of this should be a duration. Examples are 5s and 1m30s which will cause Packer to wait five seconds and one minute 30 seconds, respectively. If this isn't specified, a sensible default value is picked depending on the builder type. ex: \"1h5m2s\""
  default     = null
}

variable "boot_wait" {
  type        = string
  description = "The time to wait after booting the initial virtual machine before typing the boot_command. The value of this should be a duration. Examples are 5s and 1m30s which will cause Packer to wait five seconds and one minute 30 seconds, respectively. If this isn't specified, the default is 10s or 10 seconds. To set boot_wait to 0s, use a negative number, such as \"-1s\". ex: \"1h5m2s\""
  default     = null
}

## Guest OS Configuration

variable "guest_timezone" {
  type = string
  description = "The timezone for the installed guest operating system"
  default = "UTC"
}

variable "guest_locale" {
  type = string
  description = "The locale for the installed guest operating system"
  default = "en_US.UTF-8"
}

variable "guest_keyboard_layout" {
  type = string
  description = "The keyboard layout for the installed guest operating system"
  default = "us"
}
