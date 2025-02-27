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

resource "random_id" "mac" {
  byte_length = 6
}

locals {
  random_hex = random_id.mac.hex

  hex_digit_map = {
    "0" = 0,
    "1" = 1,
    "2" = 2,
    "3" = 3,
    "4" = 4,
    "5" = 5,
    "6" = 6,
    "7" = 7,
    "8" = 8,
    "9" = 9,
    "a" = 10,
    "b" = 11,
    "c" = 12,
    "d" = 13,
    "e" = 14,
    "f" = 15,
  }

  first_nibble   = lookup(local.hex_digit_map, lower(substr(local.random_hex, 0, 1)))
  second_nibble  = lookup(local.hex_digit_map, lower(substr(local.random_hex, 1, 1)))
  first_byte_int = local.first_nibble * 16 + local.second_nibble

  # Ensure the first byte is even (unicast) by subtracting its remainder modulo 2. 
  # This is necessary because if the first byte isnt even, the MAC address is a multicast address, 
  # which is not supported by OpenStack instances.
  fixed_first_byte_int = local.first_byte_int - (local.first_byte_int % 2)
  fixed_first_byte     = format("%02x", local.fixed_first_byte_int)

  mac_address = format(
    "%s:%s:%s:%s:%s:%s",
    local.fixed_first_byte,
    substr(local.random_hex, 2, 2),
    substr(local.random_hex, 4, 2),
    substr(local.random_hex, 6, 2),
    substr(local.random_hex, 8, 2),
    substr(local.random_hex, 10, 2)
  )
}
