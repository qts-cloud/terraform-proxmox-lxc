output "this" {
  description = "This module's main resource: `proxmox_lxc.this`"
  value       = try(proxmox_lxc.this, {})
  sensitive   = true
}


output "info" {
  description = "LXC Info"
  value = {
    id = try(split("/", proxmox_lxc.this.id)[2], "")
    host = local.target_node
  }
}

output "network" {
  description = "Network configuration"
  value = try(proxmox_lxc.this.network, {})
}
