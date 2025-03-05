data "openstack_compute_availability_zones_v2" "zones" {
  region = var.region
}

locals {
  availability_zones = data.openstack_compute_availability_zones_v2.zones.names
}

module "terraform-openstack-instance" {
  source = "git::https://gitlab.cern.ch/ai-config-team/terraform-puppet/terraform-openstack-puppet-instance.git?ref=1.0.7"
  count  = length(local.availability_zones)

  key_pair_name     = var.key_pair_name
  availability_zone = local.availability_zones[count.index]
  instance_name     = "terraform-openstack-puppet-instance-0${count.index}"
  volume_name       = "terraform-openstack-puppet-instance-0${count.index}"
}
