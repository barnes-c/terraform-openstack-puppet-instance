module "terraform-openstack-instance" {
  source = "./module"

  instance_name   = "test2-terraform-123"
  instance_flavor = "m2.small"
  key_pair_name   = "mac"
}
