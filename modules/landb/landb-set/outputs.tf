locals {
  effective_set = length(landb_set.set) > 0 ? landb_set.set[0] : data.landb_set.set[0]
}

output "set_id" {
  description = "The ID of the created set (same as name)"
  value       = local.effective_set.id
}

output "set_name" {
  description = "The name of the created set"
  value       = local.effective_set.name
}

output "set_network_domain" {
  description = "The network domain of the created set"
  value       = local.effective_set.network_domain
}

output "set_receive_notifications" {
  description = "Whether the set receives notifications"
  value       = local.effective_set.receive_notifications
}

output "set_responsible_egroup_email" {
  description = "The responsible e-group email of the created set"
  value       = local.effective_set.responsible.egroup.email
}

output "set_responsible_egroup_name" {
  description = "The responsible e-group name of the created set"
  value       = local.effective_set.responsible.egroup.name
}
