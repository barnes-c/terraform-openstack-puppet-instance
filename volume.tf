resource "openstack_blockstorage_volume_v3" "volume" {
  name              = var.volume_name
  size              = var.volume_size
  volume_type       = var.volume_type
  image_id          = var.image_ref
  availability_zone = var.volume_availability_zone
}

resource "openstack_compute_volume_attach_v2" "volume_attach" {
  instance_id = openstack_compute_instance_v2.instance.id
  volume_id   = openstack_blockstorage_volume_v3.volume.id
  device      = "/dev/vdb"
}

output "volume_id" {
  description = "The ID of the created volume"
  value       = openstack_blockstorage_volume_v3.volume.id
}

output "volume_attach_id" {
  description = "The ID of the volume attachment"
  value       = openstack_compute_volume_attach_v2.volume_attach.id
}