resource "null_resource" "certmgr_stage" {
  provisioner "local-exec" {
    command = <<EOT
      curl -X POST \
        -H "Content-Type: application/json" \
        -d '{"hostname": "${resource.foreman_host.host.interfaces_attributes[0].name}"}' \
        "https://${var.certmgr_host}:${var.certmgr_port}/krb/certmgr/staged/"
    EOT
  }
}
