module "frontend-instances" {
  source        = "git::https://gitlab.cern.ch/ai-config-team/terraform-puppet/terraform-openstack-puppet-instance.git?ref=1.0.12"
  key_pair_name = var.key_pair_name

  count             = 1
  foreman_hostgroup = "playground/chbarnes"
  instance_name     = "${var.instance_name_prefix}-${replace(var.foreman_hostgroup, "/", "-")}-${count.index + 1}"
}

module "backend-instances" {
  source        = "git::https://gitlab.cern.ch/ai-config-team/terraform-puppet/terraform-openstack-puppet-instance.git?ref=1.0.12"
  key_pair_name = var.key_pair_name

  count             = 3
  foreman_hostgroup = "playground"
  instance_name     = "${var.instance_name_prefix}-${replace(var.foreman_hostgroup, "/", "-")}-${count.index + 1}"
}

