module "terraform-openstack-instance" {
  source = "../../module"
  count  = length(var.availability_zones)

  instance_name     = "terraform-openstack-instance-0${count.index}"
  volume_name       = "terraform-openstack-instance-0${count.index}"
  key_pair_name     = "mac"
  availability_zone = var.availability_zones[count.index]
}