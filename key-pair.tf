resource "openstack_compute_keypair_v2" "kp" {
  name = var.key_pair_name
}
