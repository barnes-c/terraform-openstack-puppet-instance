output "user_data" {
  description = "The user data thats being injected in the instance"
  value       = data.template_cloudinit_config.config.rendered
}

output "instance_id" {
  description = "The OpenStack instance ID"
  value       = openstack_compute_instance_v2.instance.id
}

output "ipv4_address" {
  description = "The IPv4 address of the instance"
  value       = data.openstack_networking_port_v2.instance_port.all_fixed_ips[0]
}

output "ipv6_address" {
  description = "The IPv6 address of the instance"
  value       = data.openstack_networking_port_v2.instance_port.all_fixed_ips[1]
}

output "is_physical" {
  description = "Is the instance running on a physical machine?"
  value       = local.is_physical
}
