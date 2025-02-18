variable "glance_image_name" {
  description = "The name of the Glance image to retrieve"
  type        = string
}

variable "glance_image_id" {
  description = "The ID of the Glance image to retrieve"
  type        = string
  default     = ""
}

provider "openstack" {
  auth_url    = var.openstack_auth_url
  tenant_name = var.openstack_tenant_name
  user_name   = var.openstack_user_name
  password    = var.openstack_password
  region      = var.openstack_region
}

data "openstack_images_image_v2" "by_name" {
  name = var.glance_image_name
}

data "openstack_images_image_v2" "by_id" {
  id = var.glance_image_id
}

output "glance_image_details" {
  description = "Details of the retrieved Glance image"
  value       = data.openstack_images_image_v2.by_name
}

output "glance_image_id_details" {
  description = "Details of the retrieved Glance image by ID"
  value       = data.openstack_images_image_v2.by_id
}
