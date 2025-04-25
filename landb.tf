resource "landb_set" "set" {
  name                  = format("%s-SET", upper(var.instance_name))
  type                  = "INTERDOMAIN"
  network_domain        = "GPN"
  description           = "Terraform-managed test set"
  project_url           = "https://cern.ch"
  receive_notifications = true

  responsible = {
    type = "EGROUP"
    egroup = {
      name  = "TERRAFORM-PROVIDER-LANDB"
      email = "terraform-provider-landb@cern.ch"
    }
  }
}

resource "landb_set_attach" "set_attach" {
  set_id = landb_set.set.id
  host_ip = local.ipv4
}
