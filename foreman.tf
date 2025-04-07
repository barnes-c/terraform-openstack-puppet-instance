locals {
  is_physical = lookup(data.openstack_compute_flavor_v2.flavor.extra_specs, "cern:physical", "false") == "true"

  mac_address = local.is_physical ? "00:00:00:00:00:00" : (
    try(data.openstack_networking_port_v2.instance_port.mac_address, null)
  )
}

resource "foreman_host" "host" {
  architecture_id         = data.foreman_architecture.architecture.id
  domain_id               = data.foreman_domain.domain.id
  enable_bmc              = false
  environment_id          = data.foreman_environment.env.id
  hostgroup_id            = data.foreman_hostgroup.hostgroup.id
  manage_power_operations = false
  model_id                = data.foreman_model.model.id
  medium_id               = data.foreman_media.media.id
  name                    = var.instance_name
  operatingsystem_id      = data.foreman_operatingsystem.os.id
  ptable_id               = data.foreman_partitiontable.ptable.id
  interfaces_attributes {
    mac       = local.mac_address
    managed   = local.is_physical
    primary   = true
    provision = true
    type      = "interface"
  }
}

data "foreman_architecture" "architecture" {
  name = data.openstack_compute_flavor_v2.flavor.extra_specs["architecture"]
}

data "foreman_domain" "domain" {
  name = var.foreman_domain
}

data "foreman_environment" "env" {
  name = var.foreman_environment
}

data "foreman_hostgroup" "hostgroup" {
  title = var.foreman_hostgroup
}

data "foreman_media" "media" {
  name = var.foreman_media_name
}

data "foreman_model" "model" {
  name = var.foreman_model_name
}

data "foreman_operatingsystem" "os" {
  title = format("%s %s.%s", var.image_distro, var.image_os_major_version, var.image_os_minor_version)
}

data "foreman_partitiontable" "ptable" {
  name = var.ptable_name
}
