module "first-project" {
  source        = "git::https://gitlab.cern.ch/ai-config-team/terraform-puppet/terraform-openstack-puppet-instance.git?ref=1.0.12"
  key_pair_name = var.key_pair_name

  instance_name = "first-project-instance-01"

  providers = {
    openstack = openstack.first_project
  }
}

module "second-project" {
  source        = "git::https://gitlab.cern.ch/ai-config-team/terraform-puppet/terraform-openstack-puppet-instance.git?ref=1.0.12"
  key_pair_name = var.key_pair_name

  instance_name = "second-project-instance-01"

  providers = {
    openstack = openstack.second_project
  }
}
