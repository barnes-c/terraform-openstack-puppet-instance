# variable "certmgr_host" {
#   description = "Certificate Manager service hostname"
#   type        = string
# }

# variable "certmgr_port" {
#   description = "Certificate Manager service port"
#   type        = number
#   default     = 443
# }

# variable "certmgr_timeout" {
#   description = "Timeout for Certmgr requests"
#   type        = number
#   default     = 30
# }

# variable "certmgr_fqdn" {
#   description = "Fully Qualified Domain Name of the host to be staged"
#   type        = string
# }

# variable "certmgr_deref_alias" {
#   description = "Whether to dereference DNS aliases"
#   type        = bool
#   default     = false
# }

# resource "null_resource" "certmgr_stage" {
#   provisioner "local-exec" {
#     command = <<EOT
#       curl -X POST \
#         -H "Content-Type: application/json" \
#         -d '{"hostname": "${var.certmgr_fqdn}"}' \
#         "https://${var.certmgr_host}:${var.certmgr_port}/krb/certmgr/staged/"
#     EOT
#   }
# }

# output "certmgr_staging_status" {
#   description = "Indicates if the host has been staged in Certmgr"
#   value       = "Staging request sent for ${var.certmgr_fqdn}"  
# }

# # how to link with vm
