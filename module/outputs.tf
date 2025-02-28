output "instance_id" {
  description = "The OpenStack instance ID"
  value       = openstack_compute_instance_v2.instance.id
}

output "ipv4_address" {
  description = "The IPv4 address of the instance"
  value       = data.openstack_networking_port_v2.instance_port.fixed_ip
}
