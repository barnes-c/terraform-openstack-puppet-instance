resource "null_resource" "foreman_configuration" {
  provisioner "local-exec" {
    command = "echo $FOREMAN_CONFIG_FILE"
    environment = {
      KRB5CCNAME  = "FILE:/run/user/107352/krb5cc"
      KRB5_CONFIG = "./krb5.conf"
    }
  }
}

data "foreman_hostgroup" "hostgroup" {
  title = "playground"
}

output "hostgroup" {
  value = data.foreman_hostgroup.hostgroup
}

