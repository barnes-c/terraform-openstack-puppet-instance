module "hostgroup-1" {
  source  = "barnes-c/puppet-instance/openstack"
  version = "1.2.4"

  foreman_hostgroup = "playground/chbarnes"
  instance_name     = "test-${replace("playground/chbarnes", "/", "-")}-1"
}

module "hostgroup-2" {
  source  = "barnes-c/puppet-instance/openstack"
  version = "1.2.4"

  foreman_hostgroup = "playground"
  instance_name     = "test-${replace("playground", "/", "-")}-1"
}

