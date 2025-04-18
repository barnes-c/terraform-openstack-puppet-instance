resource "openstack_compute_instance_v2" "instance" {
  availability_zone = var.availability_zone
  flavor_id         = data.openstack_compute_flavor_v2.flavor.id
  image_id          = data.openstack_images_image_v2.image.id
  key_pair          = var.instance_key_pair_name != "" ? data.openstack_compute_keypair_v2.kp[0].name : null
  name              = var.instance_name
  user_data         = data.template_cloudinit_config.config.rendered
  security_groups = [
    for sg in values(data.openstack_networking_secgroup_v2.secgroup) : sg.name
  ]

  metadata = merge(
    {
      cern-waitdns = var.instance_waitdns
      tenant-id    = data.openstack_identity_auth_scope_v3.scope.project_id
      tenant-name  = data.openstack_identity_auth_scope_v3.scope.project_name
    },
    var.landb_mainuser != "" ? { "landb-mainuser" = var.landb_mainuser } : {},
    var.landb_responsible != "" ? { "landb-responsible" = var.landb_responsible } : {}
  )
}
