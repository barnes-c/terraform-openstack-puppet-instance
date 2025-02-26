resource "openstack_compute_instance_v2" "instance" {
  name      = var.instance_name
  image_id  = data.openstack_images_image_v2.image.id
  flavor_id = data.openstack_compute_flavor_v2.flavor.id
  key_pair  = resource.openstack_compute_keypair_v2.kp.name

  metadata = {
  }
}
