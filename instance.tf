resource "openstack_compute_instance_v2" "instance" {
  flavor_id = data.openstack_compute_flavor_v2.flavor.id
  image_id  = data.openstack_images_image_v2.image.id
  key_pair  = data.openstack_compute_keypair_v2.kp.name
  name      = var.instance_name
  user_data = local.puppet_init_script

  # metadata = {
  #   cern-waitdns = false
  # }
}
