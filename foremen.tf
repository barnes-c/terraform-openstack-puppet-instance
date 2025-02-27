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
    mac       = data.openstack_networking_port_v2.instance_port.mac_address
    managed   = true
    primary   = true
    provision = true
    type      = "interface"
  }
}

data "foreman_architecture" "architecture" {
  name = var.architecture
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
  title = format("%s %s.%s", var.distro, var.os_major_version, var.os_minor_version)
}

data "foreman_partitiontable" "ptable" {
  name = "AFS Server"
}
