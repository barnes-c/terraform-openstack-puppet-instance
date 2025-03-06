resource "null_resource" "roger" {
  triggers = {
    delete_command = <<EOT
      curl -s --negotiate -u : \
        -w "\nHTTP_STATUS:%%{http_code}\n" \
        -H "Accept: application/json" \
        -X DELETE "https://${var.roger_host}:${var.roger_port}/roger/v1/state/${resource.foreman_host.host.interfaces_attributes[0].name}/"
    EOT
  }

  provisioner "local-exec" {
    when        = create
    command     = <<EOT
      curl -s --negotiate -u : \
        -w "\nHTTP_STATUS:%%{http_code}\n" -X POST "https://${var.roger_host}:${var.roger_port}/roger/v1/state/" \
        -H "Content-Type: application/json" \
        -d "{\"hostname\": \"${resource.foreman_host.host.interfaces_attributes[0].name}\", \"message\": \"${var.roger_message}\", \"appstate\": \"${var.roger_appstate}\"}"
    EOT
    interpreter = ["/bin/bash", "-c"]
  }

  provisioner "local-exec" {
    when        = destroy
    command     = self.triggers.delete_command
    interpreter = ["/bin/bash", "-c"]
  }
}
# 