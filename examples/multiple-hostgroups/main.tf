module "hostgroup-1" {
  source = "git::https://gitlab.cern.ch/ai-config-team/terraform-puppet/terraform-openstack-puppet-instance.git?ref=1.0.13"

  foreman_hostgroup = "playground/chbarnes"
  instance_name     = "test-${replace("playground/chbarnes", "/", "-")}-1"
}

module "hostgroup-2" {
  source = "git::https://gitlab.cern.ch/ai-config-team/terraform-puppet/terraform-openstack-puppet-instance.git?ref=1.0.13"

  foreman_hostgroup = "playground"
  instance_name     = "test-${replace("playground", "/", "-")}-1"
}

