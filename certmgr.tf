resource "null_resource" "certmgr" {
  provisioner "local-exec" {
    when    = create
    command = <<EOT
      # Make hector sticky (use one specific baby)
      FQDN=$(python3 -c "import socket; print(socket.getfqdn('${var.certmgr_host}'))")

      echo "Resolved FQDN: $FQDN"

      curl -s --negotiate -u : \
        -X POST \
        -w "\\nHTTP_STATUS:%%{http_code}\\n" \
        -H "Content-Type: application/json" \
        -d '{"hostname": "${resource.foreman_host.host.interfaces_attributes[0].name}"}' \
        "https://$FQDN:${var.certmgr_port}/krb/certmgr/staged/"
    EOT
  }
}
