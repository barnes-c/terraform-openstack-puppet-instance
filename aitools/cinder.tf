variable "cinder_volume_name" {
  description = "The name of the Cinder volume"
  type        = string
}

variable "cinder_volume_size" {
  description = "Size of the Cinder volume in GB"
  type        = number
}

variable "cinder_volume_type" {
  description = "Type of the Cinder volume"
  type        = string
  default     = ""
}

variable "cinder_image_ref" {
  description = "Image to be turned into a volume (optional)"
  type        = string
  default     = ""
}

variable "cinder_availability_zone" {
  description = "Availability zone for the Cinder volume"
  type        = string
  default     = ""
}

resource "openstack_blockstorage_volume_v3" "cinder_volume" {
  name              = var.cinder_volume_name
  size              = var.cinder_volume_size
  volume_type       = var.cinder_volume_type
  image_id          = var.cinder_image_ref
  availability_zone = var.cinder_availability_zone
}

output "cinder_volume_id" {
  description = "The ID of the created Cinder volume"
  value       = openstack_blockstorage_volume_v3.cinder_volume.id
}


#missing link to vm
