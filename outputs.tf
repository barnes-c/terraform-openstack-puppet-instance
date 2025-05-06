output "all_instance_ids" {
  description = "IDs of all instances created"
  value       = module.instance[*].instance_id
}

output "all_instance_names" {
  description = "Names of all instances created"
  value       = module.instance[*].instance_name
}

output "all_ipv4_addresses" {
  description = "All IPv4 addresses of the instances"
  value       = module.instance[*].ipv4_address
}

output "all_ipv6_addresses" {
  description = "All IPv6 addresses of the instances"
  value       = module.instance[*].ipv6_address
}

output "all_is_physical" {
  description = "Are the instances running on physical machines?"
  value       = module.instance[*].is_physical
}

output "all_user_data" {
  description = "Default puppet init content + user data"
  value       = module.instance[*].user_data
}

output "flavor_id" {
  description = "The OpenStack flavor ID"
  value       = module.instance[0].flavor_id
}

output "image_id" {
  description = "The OpenStack image ID"
  value       = module.instance[0].image_id
}

output "set_attach_id" {
  description = "Attachment IDs by instance"
  value = {
    for key, m in module.landb_set_attachments :
    key => m.set_attach_id
  }
}

output "set_id" {
  description = "The name of the set"
  value       = module.landb_set.set_id
}

output "set_name" {
  description = "The name of the created set (same as ID)"
  value       = module.landb_set.set_name
}

output "set_network_domain" {
  description = "The network domain of the set"
  value       = module.landb_set.set_network_domain
}

output "set_receive_notifications" {
  description = "Whether the set receives notifications"
  value       = module.landb_set.set_receive_notifications
}

output "set_responsible_egroup_email" {
  description = "The responsible e-group email of the created set"
  value       = module.landb_set.set_responsible_egroup_email
}

output "set_responsible_egroup_name" {
  description = "The responsible e-group name of the created set"
  value       = module.landb_set.set_responsible_egroup_name
}
