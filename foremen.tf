resource "null_resource" "foreman_configuration" {
  provisioner "local-exec" {
    command = "echo 'Setting environment variables'"
    environment = {
      KRB5CCNAME  = "FILE:/run/user/107352/krb5cc"
      KRB5_CONFIG = "./krb5.conf"
    }
  }
}

data "foreman_hostgroup" "hostgroup" {
  title = var.hostgroup
}

output "hostgroup" {
  value = data.foreman_hostgroup.hostgroup
}

