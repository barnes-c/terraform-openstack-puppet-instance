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
