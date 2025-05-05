module "instance" {
  source = "./modules/instance"
  count  = var.instance_count

  availability_zone        = var.availability_zone
  certmgr_deref_alias      = var.certmgr_deref_alias
  certmgr_host             = var.certmgr_host
  certmgr_port             = var.certmgr_port
  certmgr_timeout          = var.certmgr_timeout
  foreman_domain           = var.foreman_domain
  foreman_environment      = var.foreman_environment
  foreman_hostgroup        = var.foreman_hostgroup
  foreman_hostname         = var.foreman_hostname
  foreman_location_id      = var.foreman_location_id
  foreman_media_name       = var.foreman_media_name
  foreman_model_name       = var.foreman_model_name
  foreman_organization_id  = var.foreman_organization_id
  image_distro             = var.image_distro
  image_os_major_version   = var.image_os_major_version
  image_os_minor_version   = var.image_os_minor_version
  image_ref                = var.image_ref
  instance_flavor          = var.instance_flavor
  instance_key_pair_name   = var.instance_key_pair_name
  instance_name            = var.instance_name
  instance_name_prefix     = var.instance_name_prefix
  instance_waitdns         = var.instance_waitdns
  landb_mainuser           = var.landb_mainuser
  landb_responsible        = var.landb_responsible
  no_reboot                = var.no_reboot
  ptable_name              = var.ptable_name
  puppet_master_host       = var.puppet_master_host
  region                   = var.region
  roger_appstate           = var.roger_appstate
  roger_host               = var.roger_host
  roger_message            = var.roger_message
  roger_port               = var.roger_port
  security_groups          = var.security_groups
  user_data                = var.user_data
  volume_availability_zone = var.volume_availability_zone
  volume_count             = var.volume_count
  volume_name              = var.volume_name
  volume_size              = var.volume_size
  volume_type              = var.volume_type
}


module "landb_set" {
  source = "./modules/landb/landb-set"

  name                  = var.set_name
  type                  = var.set_type
  network_domain        = var.set_network_domain
  description           = var.set_description != "" ? var.set_description : "Landb set for ${var.instance_name} deployment"
  project_url           = var.set_project_url
  receive_notifications = var.set_receive_notifications

  responsible_type         = var.responsible_type
  responsible_egroup_name  = var.responsible_egroup_name
  responsible_egroup_email = var.responsible_egroup_email
}

module "landb_set_attachments" {
  source = "./modules/landb/landb-attach"

  for_each = {
    for idx, inst in module.instance :
    format("%02d", idx + 1) => inst
  }

  set_name    = module.landb_set.set_name
  name        = "${each.value.instance_name}.cern.ch"
  ipv4        = each.value.ipv4_address
  ipv6        = each.value.ipv6_address
  description = "Interface for ${each.value.instance_name}.cern.ch"
}
