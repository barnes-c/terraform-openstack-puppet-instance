resource "foreman_host" "host" {
  architecture_id    = data.foreman_architecture.architecture.id
  operatingsystem_id = data.foreman_operatingsystem.os.id
  domain_id          = data.foreman_domain.domain.id
  ptable_id          = data.foreman_partitiontable.ptable.id
  medium_id          = data.foreman_media.media.id
  name               = var.instance_name
  hostgroup_id       = data.foreman_hostgroup.hostgroup.id
  environment_id     = data.foreman_environment.env.id
  enable_bmc         = false
  manage_power_operations = false

  interfaces_attributes {
    mac       = local.mac_address
    managed   = true
    type      = "interface"
    provision = true
    primary   = true
  }
}


data "foreman_architecture" "architecture" {
  name = var.arch
}

data "foreman_domain" "domain" {
  name = var.foreman_domain
}

data "foreman_environment" "env" {
  name = var.foreman_environment
}

data "foreman_hostgroup" "hostgroup" {
  title = var.hostgroup
}

data "foreman_operatingsystem" "os" {
  title = format("%s %s.%s", var.distro, var.os_major_version, var.os_minor_version)
}

data "foreman_media" "media" {
  name = "RedHatCERN"
}

data "foreman_partitiontable" "ptable" {
  name = "AFS Server"
}

resource "random_id" "mac" {
  byte_length = 6
}

locals {
  mac_address = format(
    "%s:%s:%s:%s:%s:%s",
    substr(random_id.mac.hex, 0, 2),
    substr(random_id.mac.hex, 2, 2),
    substr(random_id.mac.hex, 4, 2),
    substr(random_id.mac.hex, 6, 2),
    substr(random_id.mac.hex, 8, 2),
    substr(random_id.mac.hex, 10, 2)
  )
}
