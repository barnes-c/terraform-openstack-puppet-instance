output "flavor_id" {
  description = "The OpenStack flavor ID"
  value       = data.openstack_compute_flavor_v2.flavor.id
}

output "image_id" {
  description = "The OpenStack image ID"
  value       = data.openstack_images_image_v2.image.id
}

output "instance_id" {
  description = "The OpenStack instance ID"
  value       = openstack_compute_instance_v2.instance.id
}

output "instance_name" {
  description = "The name of the OpenStack instance"
  value       = openstack_compute_instance_v2.instance.name
}

output "ipv4_address" {
  description = "The IPv4 address of the instance"
  value = local.ipv4
}

output "ipv6_address" {
  description = "The IPv6 address of the instance"
  value = local.ipv6
}

output "is_physical" {
  description = "Is the instance running on a physical machine?"
  value       = local.is_physical
}

output "user_data" {
  description = "Default puppet init content + user data "
  value       = data.template_cloudinit_config.config.rendered
}
