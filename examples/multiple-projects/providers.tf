provider "foreman" {
  client_auth_negotiate = true
  location_id           = var.location_id
  organization_id       = var.organization_id
  server_hostname       = "${var.foreman_hostname}:8443" # Using port 8443 for Kerberos 
}

provider "openstack" {
  alias     = "first_project"
  tenant_id = var.tenant_id_1
}

provider "openstack" {
  alias     = "second_project"
  tenant_id = var.tenant_id_2
}
