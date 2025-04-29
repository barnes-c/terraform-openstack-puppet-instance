locals {
  has_port = !local.is_physical && length(data.openstack_networking_port_v2.instance_port) > 0
  ipv4     = local.has_port ? data.openstack_networking_port_v2.instance_port[0].all_fixed_ips[0] : null
  ipv6     = local.has_port ? data.openstack_networking_port_v2.instance_port[0].all_fixed_ips[1] : null
}

data "openstack_networking_port_v2" "instance_port" {
  count     = local.is_physical ? 0 : 1
  device_id = openstack_compute_instance_v2.instance.id
}
