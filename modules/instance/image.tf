data "openstack_images_image_v2" "image" {
  most_recent = true
  properties = {
    architecture    = data.openstack_compute_flavor_v2.flavor.extra_specs["architecture"]
    os_distro       = var.image_os
    os_distro_major = var.image_os_major_version
    os_distro_minor = var.image_os_minor_version
  }
}
