data "openstack_compute_flavor_v2" "flavor" {
  name = var.flavor
}

output "flavor" {
  value = data.openstack_compute_flavor_v2.flavor.id
}