data "openstack_networking_secgroup_v2" "ssh" {
  name = "ssh"
}

data "openstack_networking_secgroup_v2" "icmp" {
  name = "icmp"
}

data "openstack_networking_secgroup_v2" "default" {
  name = "default"
}
