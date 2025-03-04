resource "null_resource" "certmgr_stage" {
  provisioner "local-exec" {
    command = "certmgr-stage --host ${resource.foreman_host.host.interfaces_attributes[0].name} -d"
  }
}
