module "terraform-openstack-instance" {
  source = "./module"

  key_pair_name     = var.key_pair_name
}