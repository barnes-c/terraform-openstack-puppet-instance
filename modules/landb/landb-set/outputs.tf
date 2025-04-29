output "id" {
  description = "The ID of the created set (same as name)"
  value       = landb_set.set.id
}

output "name" {
  description = "The name of the created set"
  value       = landb_set.set.name
}

output "version" {
  description = "The version returned by the API"
  value       = landb_set.set.version
}
