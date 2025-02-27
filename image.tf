data "openstack_images_image_v2" "image" {
  most_recent = true
  properties = {
    architecture    = var.architecture
    os_distro       = var.distro
    os_distro_major = var.os_major_version
    os_distro_minor = var.os_minor_version
  }
}
