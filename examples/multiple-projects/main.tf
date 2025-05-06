module "first-project" {
  source  = "barnes-c/puppet-instance/openstack"
  version = "1.2.0"

  providers = {
    openstack = openstack.first_project
  }
}

module "second-project" {
  source  = "barnes-c/puppet-instance/openstack"
  version = "1.2.0"

  providers = {
    openstack = openstack.second_project
  }
}
