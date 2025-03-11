provider "foreman" {
  client_auth_negotiate = true
  location_id           = var.foreman_location_id
  organization_id       = var.foreman_organization_id
  server_hostname       = "${var.foreman_hostname}:8443" # Using port 8443 for Kerberos 
}
