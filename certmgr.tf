resource "null_resource" "certmgr_stage" {
  provisioner "local-exec" {
    command = <<EOT
        certmgr-stage --host ${resource.foreman_host.host.interfaces_attributes[0].name} -d 
    EOT
  }
}

output "certmgr_staging_status" {
  description = "Indicates if the host has been staged in Certmgr"
  value       = "Staging request sent for ${resource.foreman_host.host.interfaces_attributes[0].name}"
}
