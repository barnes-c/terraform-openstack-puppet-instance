resource "openstack_blockstorage_volume_v3" "volume" {
  count             = var.volume_size > 0 ? var.volume_count : 0
  name              = "${var.volume_name}-${count.index + 1}"
  size              = var.volume_size
  volume_type       = var.volume_type
  image_id          = var.image_ref
  availability_zone = var.volume_availability_zone
}

resource "openstack_compute_volume_attach_v2" "volume_attach" {
  count       = var.volume_size > 0 ? var.volume_count : 0
  instance_id = openstack_compute_instance_v2.instance.id
  volume_id   = openstack_blockstorage_volume_v3.volume[count.index].id
  device      = format("/dev/vd%s", element(["b", "c", "d", "e", "f", "g", "h"], count.index))
}
