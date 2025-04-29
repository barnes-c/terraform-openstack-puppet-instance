resource "landb_set" "set" {
  name                  = upper(var.name)
  type                  = var.type
  network_domain        = var.network_domain
  description           = var.description
  project_url           = var.project_url
  receive_notifications = var.receive_notifications

  responsible = {
    type = var.responsible_type

    egroup = {
      name  = var.responsible_egroup_name
      email = var.responsible_egroup_email
    }
  }
}
