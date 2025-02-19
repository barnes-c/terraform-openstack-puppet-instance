resource "openstack_blockstorage_volume_v3" "volume" {
  name              = var.volume_name
  size              = var.volume_size
  volume_type       = var.volume_type
  image_id          = var.image_ref
  availability_zone = var.volume_availability_zone
}

output "volume_id" {
  description = "The ID of the created volume"
  value       = openstack_blockstorage_volume_v3.volume.id
}


#missing link to vm
