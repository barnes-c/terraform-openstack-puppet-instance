data "openstack_compute_flavor_v2" "flavor" {
  name = var.instance_flavor
}
