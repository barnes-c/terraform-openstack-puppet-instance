data "openstack_networking_port_v2" "instance_port" {
  device_id = openstack_compute_instance_v2.instance.id
}
