module "first-project" {
  source        = "git::https://gitlab.cern.ch/ai-config-team/terraform-puppet/terraform-openstack-puppet-instance.git?ref=1.0.18"
  instance_name = "first-project-instance-1"

  providers = {
    openstack = openstack.first_project
  }
}

module "second-project" {
  source        = "git::https://gitlab.cern.ch/ai-config-team/terraform-puppet/terraform-openstack-puppet-instance.git?ref=1.0.18"
  instance_name = "second-project-instance-1"

  providers = {
    openstack = openstack.second_project
  }
}
