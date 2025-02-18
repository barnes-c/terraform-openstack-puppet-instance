terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "3.0.0"
    }
  }
}

provider "openstack" {

}

data "openstack_images_image_v2" "image" {
  most_recent = true

  properties = {
    os_distro       = var.distro
    os_distro_major = var.os_major_version
    architecture    = var.arch
  }
}

resource "openstack_compute_instance_v2" "instance" {
  name      = var.instance_name
  image_id  = data.openstack_images_image_v2.image.id
  flavor_id = data.openstack_compute_flavor_v2.flavor.id
  key_pair  = resource.openstack_compute_keypair_v2.kp.name

  metadata = {
    this = "that"
  }
}