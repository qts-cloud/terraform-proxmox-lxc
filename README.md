# terraform-proxmox-lxc
Create an LXC Container

<!-- BEGIN_TF_DOCS -->
[![semantic-release-badge]][semantic-release]

## Usage

Basic usage of this module:

---
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) | 3.0.1-rc4 |
## Resources

| Name | Type |
|------|------|
| [proxmox_lxc.this](https://registry.terraform.io/providers/Telmate/proxmox/3.0.1-rc4/docs/resources/lxc) | resource |
| [random_password.root](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_config"></a> [config](#input\_config) | Configure LXC Container | <pre>object({<br/>    # (Required) A string containing the cluster node name.<br/>    target_node = string<br/>    # (Required) The volume identifier that points to the OS template or backup file.<br/>    ostemplate = optional(string)<br/>    # (Optional) Sets the container OS architecture type. Default is "amd64".<br/>    arch = optional(string)<br/>    # (Optional) A number for setting the override I/O bandwidth limit (in KiB/s).<br/>    bwlimit = optional(number)<br/>    # (Optional) The lxc vmid to clone<br/>    clone = optional(string)<br/>    # (Optional) Target storage for full clone.<br/>    clone_storage = optional(string)<br/>    # (Optional) Configures console mode. "tty" tries to open a connection to one of the available tty devices. "console" tries to attach to /dev/console instead. "shell" simply invokes a shell inside the container (no login). Default is "tty".<br/>    cmode = optional(string)<br/>    # (Optional) A boolean to attach a console device to the container. Default is true.<br/>    console = optional(string)<br/>    # (Optional) The number of cores assigned to the container. A container can use all available cores by default.<br/>    cores = optional(string)<br/>    # (Optional) A number to limit CPU usage by. Default is 0.<br/>    cpulimit = optional(string)<br/>    # (Optional) A number of the CPU weight that the container possesses. Default is 1024.<br/>    cpuunits = optional(string)<br/>    # (Optional) Sets the container description seen in the web interface.<br/>    description = optional(string)<br/>    # (Optional) An object for allowing the container to access advanced features.<br/>    features = optional(object({<br/>      # (Optional) A boolean for enabling FUSE mounts.<br/>      fuse = optional(bool)<br/>      # (Optional) A boolean for enabling the keyctl() system call.<br/>      keyctl = optional(bool)<br/>      # (Optional) Defines the filesystem types (separated by semicolons) that are allowed to be mounted.<br/>      mount = optional(string)<br/>      # (Optional) A boolean to allow nested virtualization.<br/>      nesting = optional(bool)<br/>    }))<br/>    # (Optional) A boolean that allows the overwriting of pre-existing containers.<br/>    force = optional(bool)<br/>    # (Optional) When cloning, create a full copy of all disks. This is always done when you clone a normal CT. For CT template it creates a linked clone by default.<br/>    full = optional(bool)<br/>    # (Optional) Requested HA state for the resource. One of "started", "stopped", "enabled", "disabled", or "ignored". See the docs about HA for more info.<br/>    hastate = optional(string)<br/>    # (Optional) The HA group identifier the resource belongs to (requires hastate to be set!). See the docs about HA for more info.<br/>    hagroup = optional(string)<br/>    # (Optional) A string containing a volume identifier to a script that will be executed during various steps throughout the container's lifetime. The script must be an executable file.<br/>    hookscript = optional(string)<br/>    # (Required) Specifies the host name of the container.<br/>    hostname = string<br/>    # (Optional) A boolean that determines if template extraction errors are ignored during container creation.<br/>    ignore_unpack_errors = optional(bool)<br/>    # (Optional) A string for locking or unlocking the VM.<br/>    lock = optional(string)<br/>    # (Optional) A number containing the amount of RAM to assign to the container (in MB).<br/>    memory = optional(number)<br/><br/>    # (Optional) An object for defining a volume to use as a container mount point. Can be specified multiple times.<br/>    mountpoint = optional(list(object({<br/>      # (Required) The path to the mount point as seen from inside the container. The path must not contain symlinks for security reasons.<br/>      mp = string<br/>      # (Required) Size of the underlying volume. Must end in T, G, M, or K (e.g. "1T", "1G", "1024M" , "1048576K"). Note that this is a read only value.<br/>      size = string<br/>      # (Required) A string containing the number that identifies the mount point (i.e. the n in mp[n]).<br/>      slot = string<br/>      # (Required) The number that identifies the mount point (i.e. the n in mp[n]).<br/>      key = number<br/>      # (Required) A string containing the volume , directory, or device to be mounted into the container (at the path specified by mp). E.g. local-lvm, local-zfs, local etc.<br/>      storage = string<br/>      # (Optional) A boolean for enabling ACL support. Default is false.<br/>      acl = optional(bool)<br/>      # (Optional) A boolean for including the mount point in backups. Default is false.<br/>      backup = optional(bool)<br/>      # (Optional) A boolean for enabling user quotas inside the container for this mount point. Default is false.<br/>      quota = optional(bool)<br/>      # (Optional) A boolean for including this volume in a storage replica job. Default is false.<br/>      replicate = optional(bool)<br/>      # (Optional) A boolean for marking the volume as available on all nodes. Default is false.<br/>      shared = optional(bool)<br/>    })))<br/><br/>    # (Optional) An object defining a network interface for the container. Can be specified multiple times.<br/>    network = optional(list(object({<br/>      # (Required)  = optional(string) The name of the network interface as seen from inside the container (e.g. "eth0").<br/>      name = string<br/>      # (Optional) The bridge to attach the network interface to (e.g. "vmbr0").<br/>      bridge = optional(string)<br/>      # (Optional) A boolean to enable the firewall on the network interface.<br/>      firewall = optional(bool)<br/>      # (Optional) The IPv4 address belonging to the network interface's default gateway.<br/>      gw = optional(string)<br/>      # (Optional) The IPv6 address of the network interface's default gateway.<br/>      gw6 = optional(string)<br/>      # (Optional) A string to set a common MAC address with the I/G (Individual/Group) bit not set. Automatically determined if not set.<br/>      hwaddr = optional(string)<br/>      # (Optional) The IPv4 address of the network interface. Can be a static IPv4 address (in CIDR notation), "dhcp", or "manual". Default "dhcp".<br/>      ip = optional(string)<br/>      # (Optional) The IPv6 address of the network interface. Can be a static IPv6 address (in CIDR notation), "auto" , "dhcp", or "manual".<br/>      ip6 = optional(string)<br/>      # (Optional) A string to set the MTU on the network interface.<br/>      mtu = optional(string)<br/>      # (Optional) A number that sets rate limiting on the network interface (Mbps).<br/>      rate = optional(string)<br/>      # (Optional) A number that specifies the VLAN tag of the network interface. Automatically determined if not set.<br/>      tag = optional(string)<br/>    })))<br/><br/>    # (Optional) A boolean that determines if the container will start on boot. Default is false.<br/>    onboot = optional(bool)<br/>    # (Optional) The operating system type, used by LXC to set up and configure the container. Automatically determined if not set.<br/>    ostype = optional(string)<br/>    # (Optional) Sets the root password inside the container.<br/>    password = optional(string)<br/>    # (Optional) The name of the Proxmox resource pool to add this container to.<br/>    pool = optional(string)<br/>    # (Optional) A boolean that enables the protection flag on this container. Stops the container and its disk from being removed/updated. Default is false.<br/>    protection = optional(bool)<br/>    # (Optional) A boolean to mark the container creation/update as a restore task.<br/>    restore = optional(bool)<br/>    # (Optional) An object for configuring the root mount point of the container. Can only be specified once.<br/>    rootfs = optional(object({<br/>      # (Required) Size of the underlying volume. Must end in T, G, M, or K (e.g. "1T", "1G", "1024M" , "1048576K"). Note that this is a read only value.<br/>      size = string<br/>      # (Required) A string containing the volume , directory, or device to be mounted into the container (at the path specified by mp). E.g. local-lvm, local-zfs, local etc.<br/>      storage = string<br/>    }))<br/><br/>    # (Optional) The DNS server IP address used by the container. If neither nameserver nor searchdomain are specified, the values of the Proxmox host will be used by default.<br/>    nameserver = optional(string)<br/>    # (Optional) Sets the DNS search domains for the container. If neither nameserver nor searchdomain are specified, the values of the Proxmox host will be used by default.<br/>    searchdomain = optional(string)<br/>    # (Optional) Multi-line string of SSH public keys that will be added to the container. Can be defined using heredoc syntax.<br/>    ssh_public_keys = optional(string)<br/>    # (Optional) A boolean that determines if the container is started after creation. Default is false.<br/>    start = optional(bool)<br/>    # (Optional) The startup and shutdown behaviour of the container.<br/>    startup = optional(string)<br/>    # (Optional) A number that sets the amount of swap memory available to the container. Default is 512.<br/>    swap = optional(number)<br/>    # (Optional) Tags of the container. This is only meta information.<br/>    tags = optional(string)<br/>    # (Optional) A boolean that determines if this container is a template.<br/>    template = optional(bool)<br/>    # (Optional) A number that specifies the TTYs available to the container. Default is 2.<br/>    tty = optional(number)<br/>    # (Optional) A boolean that determines if a unique random ethernet address is assigned to the container.<br/>    unique = optional(bool)<br/>    # (Optional) A boolean that makes the container run as an unprivileged user. Default is true.<br/>    unprivileged = optional(bool)<br/>    # (Optional) A number that sets the VMID of the container. If set to 0, the next available VMID is used. Default is 0.<br/>    vmid = optional(number)<br/>  })</pre> | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_info"></a> [info](#output\_info) | LXC Info |
| <a name="output_network"></a> [network](#output\_network) | Network configuration |
| <a name="output_this"></a> [this](#output\_this) | This module's main resource: `proxmox_lxc.this` |
---
[semantic-release-badge]: https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg
[conventional-commits]: https://www.conventionalcommits.org/
[semantic-release]: https://semantic-release.gitbook.io
[semantic-release-badge]: https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg
[vscode-conventional-commits]: https://marketplace.visualstudio.com/items?itemName=vivaxy.vscode-conventional-commits
<!-- END_TF_DOCS -->
