data "openstack_images_image_v2" "name" {
  name = var.image_name
}

output "image_details" {
  description = "Details of the retrieved image"
  value       = data.openstack_images_image_v2.name
}

# output "image_id_details" {
#   description = "Details of the retrieved image by ID"
#   value       = data.openstack_images_image_v2.id
# }
