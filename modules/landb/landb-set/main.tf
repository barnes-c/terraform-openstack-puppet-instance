resource "landb_set" "set" {
  count                 = var.set_present ? 0 : 1
  name                  = upper(var.name)
  type                  = var.type
  network_domain        = var.network_domain
  description           = var.description
  project_url           = var.project_url
  receive_notifications = var.receive_notifications

  responsible = {
    type = var.responsible_type

    egroup = {
      name  = var.responsible
      email = var.responsible_email
    }
  }
}

data "landb_set" "set" {
  count = var.set_present ? 1 : 0
  name  = upper(var.name)
}