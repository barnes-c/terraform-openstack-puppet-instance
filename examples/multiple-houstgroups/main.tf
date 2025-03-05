module "frontend-instances" {
  source        = "git::https://gitlab.cern.ch/ai-config-team/terraform-puppet/terraform-openstack-puppet-instance.git?ref=1.0.9"
  key_pair_name = var.key_pair_name

  count             = 1
  foreman_hostgroup = "playground/chbarnes"
  instance_name     = "frontend-${replace(var.foreman_hostgroup, "/", "-")}-${count.index + 1}"
}

module "backend-instances" {
  source        = "git::https://gitlab.cern.ch/ai-config-team/terraform-puppet/terraform-openstack-puppet-instance.git?ref=1.0.9"
  key_pair_name = var.key_pair_name

  count             = 3
  foreman_hostgroup = "playground"
  instance_name     = "backend-${replace(var.foreman_hostgroup, "/", "-")}-${count.index + 1}"
}

