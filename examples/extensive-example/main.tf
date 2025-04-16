module "example-instances1" {
  source  = "barnes-c/puppet-instance/openstack"
  version = "1.1.3"

  foreman_environment = var.foreman_environment
  foreman_hostgroup   = "playground/chbarnes"

  count                = var.instance_count
  instance_flavor      = var.instance_flavor
  instance_name = "${var.instance_name_prefix}-${replace("playground/chbarnes", "/", "-")}-${count.index + 1}"
  instance_name_prefix = var.instance_name_prefix

  image_distro           = var.image_distro
  image_os_major_version = var.image_os_major_version
  image_os_minor_version = var.image_os_minor_version

  region = var.region

  security_groups = var.security_groups

  user_data = var.user_data

  volume_count = var.volume_count
  volume_size  = var.volume_size
  volume_type  = var.volume_type
}

module "example-instances2" {
  source  = "barnes-c/puppet-instance/openstack"
  version = "1.1.3"

  foreman_environment = var.foreman_environment
  foreman_hostgroup   = "playground"

  count                = var.instance_count
  instance_flavor      = var.instance_flavor
  instance_name        = "${var.instance_name_prefix}-${replace(var.foreman_hostgroup, "/", "-")}-${count.index + 1}"
  instance_name_prefix = var.instance_name_prefix

  image_distro           = var.image_distro
  image_os_major_version = var.image_os_major_version
  image_os_minor_version = var.image_os_minor_version

  region = var.region

  security_groups = var.security_groups

  user_data = var.user_data

  volume_count = var.volume_count
  volume_size  = var.volume_size
  volume_type  = var.volume_type
}

