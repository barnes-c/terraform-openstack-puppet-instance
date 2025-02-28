module "terraform-openstack-instance" {
  source = "./module"

  instance_name = "terraform-openstack-instance1"
  key_pair_name = "mac"
}
