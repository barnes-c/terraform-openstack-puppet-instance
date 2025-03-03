module "terraform-openstack-instance" {
  source = "../../module"
  count  = length(var.availability_zones)

  instance_name     = "terraform-openstack-instance-1${count.index}"
  volume_name       = "terraform-openstack-instance-1${count.index}"
  key_pair_name     = var.key_pair_name
  availability_zone = var.availability_zones[count.index]
}