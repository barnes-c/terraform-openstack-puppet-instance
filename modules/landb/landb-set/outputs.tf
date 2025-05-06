output "set_id" {
  description = "The ID of the created set (same as name)"
  value       = landb_set.set.id
}

output "set_name" {
  description = "The name of the created set"
  value       = landb_set.set.name
}

output "set_network_domain" {
  description = "The network domain of the created set"
  value       = landb_set.set.network_domain
}

output "set_receive_notifications" {
  description = "Whether the set receives notifications"
  value       = landb_set.set.receive_notifications
}

output "set_responsible_egroup_email" {
  description = "The responsible e-group email of the created set"
  value       = landb_set.set.responsible.egroup.email
}

output "set_responsible_egroup_name" {
  description = "The responsible e-group name of the created set"
  value       = landb_set.set.responsible.egroup.name
}
