data "openstack_compute_availability_zones_v2" "zones" {
  region = var.region
  state  = "available"
}

locals {
  availability_zones = data.openstack_compute_availability_zones_v2.zones.names

  # If there are more zones than desired, take only the first max_availability_zones.
  limited_availability_zones = (
    length(local.availability_zones) > var.max_availability_zones ?
    slice(local.availability_zones, 0, var.max_availability_zones) :
    local.availability_zones
  )
}

module "terraform-openstack-instance" {
  source = "git::https://gitlab.cern.ch/ai-config-team/terraform-puppet/terraform-openstack-puppet-instance.git?ref=1.0.9"
  count  = length(local.limited_availability_zones)

  key_pair_name     = var.key_pair_name
  availability_zone = local.limited_availability_zones[count.index]
  instance_name     = "terraform-openstack-puppet-instance-az-${count.index}"
  volume_name       = "terraform-openstack-puppet-instance-az-${count.index}"
}
