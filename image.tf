data "openstack_images_image_v2" "image" {
  most_recent = true

  properties = {
    os_distro       = var.distro
    os_distro_major = var.os_major_version
    architecture    = var.architecture
  }
}
