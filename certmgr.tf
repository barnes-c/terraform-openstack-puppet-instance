resource "null_resource" "certmgr" {
  provisioner "local-exec" {
    when    = create
    command = <<EOT
      curl -s --negotiate -u : \
        -X POST \
        -w "\nHTTP_STATUS:%%{http_code}\n" \
        -H "Content-Type: application/json" \
        -d '{"hostname": "${resource.foreman_host.host.interfaces_attributes[0].name}"}' \
        "https://${var.certmgr_host}:${var.certmgr_port}/krb/certmgr/staged/"
    EOT
  }
}
