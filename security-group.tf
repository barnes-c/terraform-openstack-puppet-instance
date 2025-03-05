data "openstack_networking_secgroup_v2" "secgroup" {
  for_each = toset(var.security_groups)
  name     = each.value
}
