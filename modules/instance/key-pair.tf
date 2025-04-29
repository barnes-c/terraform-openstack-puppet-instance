data "openstack_compute_keypair_v2" "kp" {
  count = var.instance_key_pair_name != "" ? 1 : 0
  name  = var.instance_key_pair_name
}
